use v6;

# There is bug in PGE with doesn't handle :: names properly
grammar XQueryGrammar {

    rule TOP { 
        <Module> $
    };

#[1]    	Module 	   ::=    	VersionDecl? (LibraryModule | MainModule)
    rule  Module  { <VersionDecl>? [ <MainModule> ] };

    rule  VersionDecl    { 'xquery' 'version' <StringLiteral> [ 'encoding' <StringLiteral> ]? ';' };
    
    rule  MainModule     { <Prolog> <commit> <QueryBody> };

##[4]    	LibraryModule 	   ::=    	ModuleDecl Prolog
##[5]    	ModuleDecl 	   ::=    	"module" "namespace" NCName "=" URILiteral Separator
##[6]    	Prolog 	   ::=    	((DefaultNamespaceDecl | Setter | NamespaceDecl | Import) Separator)* ((VarDecl | FunctionDecl | OptionDecl) Separator)*
    rule Prolog {
        [ <VarDecl> ';' ]*
#        [
#            [ 
#                | <DefaultNamespaceDecl> 
#                | <Setter> 
#                | <NamespaceDecl> 
#                | <Import> 
#            ] 
#            ';'
#        ]* 
#        [
#            [ 
#                 <VarDecl> 
#                | <FunctionDecl> 
#                | <OptionDecl> 
#            ] 
#            ';'
#        ]*
    };

##[7]    	Setter 	   ::=    	BoundarySpaceDecl | DefaultCollationDecl | BaseURIDecl | ConstructionDecl | OrderingModeDecl | EmptyOrderDecl | CopyNamespacesDecl
##[8]    	Import 	   ::=    	SchemaImport | ModuleImport
##[9]    	Separator 	   ::=    	";"
##[10]    	NamespaceDecl 	   ::=    	"declare" "namespace" NCName "=" URILiteral
##[11]    	BoundarySpaceDecl 	   ::=    	"declare" "boundary-space" ("preserve" | "strip")
##[12]    	DefaultNamespaceDecl 	   ::=    	"declare" "default" ("element" | "function") "namespace" URILiteral
##[13]    	OptionDecl 	   ::=    	"declare" "option" QName StringLiteral
##[14]    	OrderingModeDecl 	   ::=    	"declare" "ordering" ("ordered" | "unordered")
##[15]    	EmptyOrderDecl 	   ::=    	"declare" "default" "order" "empty" ("greatest" | "least")
##[16]    	CopyNamespacesDecl 	   ::=    	"declare" "copy-namespaces" PreserveMode "," InheritMode
##[17]    	PreserveMode 	   ::=    	"preserve" | "no-preserve"
##[18]    	InheritMode 	   ::=    	"inherit" | "no-inherit"
##[19]    	DefaultCollationDecl 	   ::=    	"declare" "default" "collation" URILiteral
##[20]    	BaseURIDecl 	   ::=    	"declare" "base-uri" URILiteral
##[21]    	SchemaImport 	   ::=    	"import" "schema" SchemaPrefix? URILiteral ("at" URILiteral ("," URILiteral)*)?
##[22]    	SchemaPrefix 	   ::=    	("namespace" NCName "=") | ("default" "element" "namespace")
##[23]    	ModuleImport 	   ::=    	"import" "module" ("namespace" NCName "=")? URILiteral ("at" URILiteral ("," URILiteral)*)?

    rule VarDecl {
        'declare' 'variable' '$' <QName> [ [':=' <ExprSingle>] | 'external' ]
    };

##[25]    	ConstructionDecl 	   ::=    	"declare" "construction" ("strip" | "preserve")
##[26]    	FunctionDecl 	   ::=    	"declare" "function" QName "(" ParamList? ")" ("as" SequenceType)? (EnclosedExpr | "external")
##[27]    	ParamList 	   ::=    	Param ("," Param)*
##[28]    	Param 	   ::=    	"$" QName TypeDeclaration?
##[29]    	EnclosedExpr 	   ::=    	"{" Expr "}"
    
    rule QueryBody { <Expr> };

    rule Expr      { <ExprSingle> [ ',' <ExprSingle> ]* };

##[32]    	ExprSingle 	   ::=    	FLWORExpr
##| QuantifiedExpr
##| TypeswitchExpr
##| IfExpr
##| OrExpr
    rule ExprSingle { 
        | <FLWORExpr>
##| QuantifiedExpr
##| TypeswitchExpr
        | <IfExpr>
        | <OrExpr> 
    };

    rule FLWORExpr { [ <ForClause> | <LetClause> ]+ <WhereClause>? <OrderByClause>? 'return' <ExprSingle> };

##[34]    	ForClause 	   ::=    	"for" "$" VarName TypeDeclaration? PositionalVar? "in" ExprSingle ("," "$" VarName TypeDeclaration? PositionalVar? "in" ExprSingle)*
    rule ForClause { 
        'for' '$' <VarName> 'in' <ExprSingle>
    };
            #'for' '$' <VarName> <TypeDeclaration>? <PositionalVar>? 'in' <ExprSingle>
            #[ ',' '$' <VarName> <TypeDeclaration>? <PositionalVar>? 'in' <ExprSingle> ]*
    
    rule PositionalVar { 'at' '$' <VarName> };

##[36]    	LetClause 	   ::=    	"let" "$" VarName TypeDeclaration? ":=" ExprSingle ("," "$" VarName TypeDeclaration? ":=" ExprSingle)*
    rule LetClause     { 
        'let' '$' <VarName> ':=' <ExprSingle> 
    };
            #'let' '$' <VarName> <TypeDeclaration>? ':=' <ExprSingle> 
            #[',' '$' <VarName> <TypeDeclaration>? ':=' <ExprSingle>]* 

    rule WhereClause { 'where' <ExprSingle> };

    rule OrderByClause { [ [ 'order' 'by' ] | ['stable' 'order' 'by' ] ] <OrderSpecList> };

    rule OrderSpecList { <OrderSpec> [ ',' <OrderSpec> ]* };

    rule OrderSpec     { <ExprSingle> <OrderModifier> };

    rule OrderModifier { [ 'ascending' | 'descending' ]? [ 'empty' [ 'greatest' | 'least' ] ]? [ 'collation' <URILiteral>]? };

##[42]    	QuantifiedExpr 	   ::=    	("some" | "every") "$" VarName TypeDeclaration? "in" ExprSingle ("," "$" VarName TypeDeclaration? "in" ExprSingle)* "satisfies" ExprSingle
##[43]    	TypeswitchExpr 	   ::=    	"typeswitch" "(" Expr ")" CaseClause+ "default" ("$" VarName)? "return" ExprSingle
##[44]    	CaseClause 	   ::=    	"case" ("$" VarName "as")? SequenceType "return" ExprSingle
    rule IfExpr { 'if' '(' <Expr> ')' 'then' <ExprSingle> 'else' <ExprSingle> };

    rule OrExpr { <AndExpr> [ 'or' <AndExpr>]* };

    rule AndExpr { <ComparisonExpr> [ 'and' <ComparisonExpr>]* };

    rule ComparisonExpr {
        <RangeExpr> [ [ <ValueComp> | <GeneralComp> | <NodeComp> ] <RangeExpr> ]?
    };

    rule RangeExpr { <AdditiveExpr> [ 'to' <AdditiveExpr> ]? };

    rule AdditiveExpr { <MultiplicativeExpr> [ ['+' | '-'] <MultiplicativeExpr> ]* };

    rule MultiplicativeExpr { <UnionExpr> [ ['*' | 'div'| 'idiv' | 'mod'] <UnionExpr> ]* };

    rule UnionExpr { <IntersectExceptExpr> [ ['union' | '|'] <IntersectExceptExpr> ]* };

    rule IntersectExceptExpr { <InstanceofExpr> [ ['intersect' | 'except'] <InstanceofExpr> ]* };

    rule InstanceofExpr { <TreatExpr> [ 'instance' 'of' <SequenceType> ]? };
    
    rule TreatExpr { <CastableExpr> [ 'treat' 'as' <SequenceType> ]? };
    
    rule CastableExpr { <CastExpr> [ 'castable' 'as' <SingleType> ]? };
    
    rule CastExpr { <UnaryExpr> [ 'cast' 'as' <SingleType> ]? };

    rule UnaryExpr { ['-'|'+']* <ValueExpr> };

##[59]    	ValueExpr 	   ::=    	ValidateExpr | PathExpr | ExtensionExpr
    # XXX Shortcut for non-implemented features
    rule ValueExpr { <PathExpr> };

    token GeneralComp { '=' | '!=' | '<' | '<=' | '>' | '>=' };

    token ValueComp { 'eq' | 'ne' | 'le' | 'lt' | 'gt' | 'ge' };

    token NodeComp { 'is' | '<<' | '>>' };

##[63]    	ValidateExpr 	   ::=    	"validate" ValidationMode? "{" Expr "}"
##[64]    	ValidationMode 	   ::=    	"lax" | "strict"
##[65]    	ExtensionExpr 	   ::=    	Pragma+ "{" Expr? "}"
##[66]    	Pragma 	   ::=    	"(#" S? QName (S PragmaContents)? "#)" 	/* ws: explicit */
##[67]    	PragmaContents 	   ::=    	(Char* - (Char* '#)' Char*))

##[68]    	PathExpr 	   ::=    	("/" RelativePathExpr?)
##| ("//" RelativePathExpr)
##| RelativePathExpr 	/* xgs: leading-lone-slash */
    # LTM
    rule PathExpr {
        | '//' <RelativePathExpr>
        | '/' <RelativePathExpr>
        | <RelativePathExpr>
    };

##[69]    	RelativePathExpr 	   ::=    	StepExpr (("/" | "//") StepExpr)*
    # LTM
    rule RelativePathExpr {
        <StepExpr> [ [ '//' | '/' ] <StepExpr> ]*
    };

    rule StepExpr {
        <FilterExpr> | <AxisStep>
    };

    rule AxisStep {
        [ <ReverseStep> | <ForwardStep> ] <PredicateList>
    };

    rule ForwardStep {
        [ <ForwardAxis> <NodeTest> ] | <AbbrevForwardStep>
    };

##[73]    	ForwardAxis 	   ::=    	("child" "::")
##| ("descendant" "::")
##| ("attribute" "::")
##| ("self" "::")
##| ("descendant-or-self" "::")
##| ("following-sibling" "::")
##| ("following" "::")
    # LTM
    rule ForwardAxis {
        [
            | 'descendant-or-self'
            | 'descendant'
            | 'attribute'
            | 'self'
            | 'following-sibling'
            | 'following'
        ]
        '::'
    };

    rule AbbrevForwardStep {
        '@'? <NodeTest>
    };

##[75]    	ReverseStep 	   ::=    	(ReverseAxis NodeTest) | AbbrevReverseStep
    rule ReverseStep {
        | <ReverseAxis> <NodeTest>
        | <AbbrevReverseStep>
    };

##[76]    	ReverseAxis 	   ::=    	("parent" "::")
##| ("ancestor" "::")
##| ("preceding-sibling" "::")
##| ("preceding" "::")
##| ("ancestor-or-self" "::")
    # LTM
    rule ReverseAxis {
        [
            | 'parent'
            | 'ancestor-or-self'
            | 'ancestor'
            | 'preceding-sibling'
            | 'preceding'
        ]
        '::'
    };
    
    rule AbbrevReverseStep { '..' };

##[78]    	NodeTest 	   ::=    	KindTest | NameTest
    rule NodeTest {
        <KindTest> | <NameTest>
    };

##[79]    	NameTest 	   ::=    	QName | Wildcard
    rule NameTest {
        <QName> | <Wildcard>
    };

##[80]    	Wildcard 	   ::=    	"*"
##| (NCName ":" "*")
##| ("*" ":" NCName) 	/* ws: explicit */
    # LTM
    token Wildcard {
        | '*' ':' <NCName>
        | <NCName> ':' '*'
        | '*'
    };

    rule FilterExpr {
        <PrimaryExpr> <PredicateList>
    };
    
    rule PredicateList {
        <Predicate>*
    };

    rule Predicate {
        '[' <Expr> ']'
    };
##[84]    	PrimaryExpr 	   ::=    	Literal | VarRef | ParenthesizedExpr | ContextItemExpr | FunctionCall | OrderedExpr | UnorderedExpr | Constructor
    token PrimaryExpr {
        | <Literal>
        | <VarRef>
        | <ParenthesizedExpr>
        | <ContextItemExpr>
        | <FunctionCall>
        | <OrderedExpr>
        | <UnorderedExpr>
        #| <Constructor>
    };

    token Literal        { [ <NumericLiteral> | <StringLiteral> ] };

    token NumericLiteral { <DoubleLiteral> | <DecimalLiteral> | <IntegerLiteral> };

    token VarRef         { '$' <VarName> };
    
    token VarName        { <QName> };

    rule  ParenthesizedExpr { '(' <Expr>? ')' };

    rule ContextItemExpr { '.' };

    rule OrderedExpr {
        'ordered' '{' <Expr> '}'
    };

    rule UnorderedExpr {
        'unordered' '{' <Expr> '}'
    };

##[93]    	FunctionCall 	   ::=    	QName "(" (ExprSingle ("," ExprSingle)*)? ")" 	/* xgs: reserved-function-names */
##				/* gn: parens */
    rule  FunctionCall {
        <QName> '(' [ <ExprSingle> [ ',' <ExprSingle>]* ]? ')'
    };

##[94]    	Constructor 	   ::=    	DirectConstructor
##| ComputedConstructor
##[95]    	DirectConstructor 	   ::=    	DirElemConstructor
##| DirCommentConstructor
##| DirPIConstructor
##[96]    	DirElemConstructor 	   ::=    	"<" QName DirAttributeList ("/>" | (">" DirElemContent* "</" QName S? ">")) 	/* ws: explicit */
##[97]    	DirAttributeList 	   ::=    	(S (QName S? "=" S? DirAttributeValue)?)* 	/* ws: explicit */
##[98]    	DirAttributeValue 	   ::=    	('"' (EscapeQuot | QuotAttrValueContent)* '"')
##| ("'" (EscapeApos | AposAttrValueContent)* "'") 	/* ws: explicit */
##[99]    	QuotAttrValueContent 	   ::=    	QuotAttrContentChar
##| CommonContent
##[100]    	AposAttrValueContent 	   ::=    	AposAttrContentChar
##| CommonContent
##[101]    	DirElemContent 	   ::=    	DirectConstructor
##| CDataSection
##| CommonContent
##| ElementContentChar
##[102]    	CommonContent 	   ::=    	PredefinedEntityRef | CharRef | "{{" | "}}" | EnclosedExpr
##[103]    	DirCommentConstructor 	   ::=    	"<!--" DirCommentContents "-->" 	/* ws: explicit */
##[104]    	DirCommentContents 	   ::=    	((Char - '-') | ('-' (Char - '-')))* 	/* ws: explicit */
##[105]    	DirPIConstructor 	   ::=    	"<?" PITarget (S DirPIContents)? "?>" 	/* ws: explicit */
##[106]    	DirPIContents 	   ::=    	(Char* - (Char* '?>' Char*)) 	/* ws: explicit */
##[107]    	CDataSection 	   ::=    	"<![CDATA[" CDataSectionContents "]]>" 	/* ws: explicit */
##[108]    	CDataSectionContents 	   ::=    	(Char* - (Char* ']]>' Char*)) 	/* ws: explicit */
##[109]    	ComputedConstructor 	   ::=    	CompDocConstructor
##| CompElemConstructor
##| CompAttrConstructor
##| CompTextConstructor
##| CompCommentConstructor
##| CompPIConstructor
##[110]    	CompDocConstructor 	   ::=    	"document" "{" Expr "}"
##[111]    	CompElemConstructor 	   ::=    	"element" (QName | ("{" Expr "}")) "{" ContentExpr? "}"
##[112]    	ContentExpr 	   ::=    	Expr
##[113]    	CompAttrConstructor 	   ::=    	"attribute" (QName | ("{" Expr "}")) "{" Expr? "}"
##[114]    	CompTextConstructor 	   ::=    	"text" "{" Expr "}"
##[115]    	CompCommentConstructor 	   ::=    	"comment" "{" Expr "}"
##[116]    	CompPIConstructor 	   ::=    	"processing-instruction" (NCName | ("{" Expr "}")) "{" Expr? "}"
    token SingleType { <AtomicType> '?'? };

    rule  TypeDeclaration { 'as' <SequenceType> };

    rule  SequenceType {
        'empty-sequence' '(' ')'
        | <ItemType> <OccurrenceIndicator>?
    };
    
    token OccurrenceIndicator { '?' | '*' | '+' };

##[121]    	ItemType 	   ::=    	KindTest | ("item" "(" ")") | AtomicType
    rule ItemType { <KindTest> | 'item' '(' ')' | <AtomicType> };

    token AtomicType { <QName> };

##[123]    	KindTest 	   ::=    	DocumentTest
##| ElementTest
##| AttributeTest
##| SchemaElementTest
##| SchemaAttributeTest
##| PITest
##| CommentTest
##| TextTest
##| AnyKindTest
    rule KindTest {
        | <DocumentTest>
        | <ElementTest>
        | <AttributeTest>
        | <SchemaElementTest>
        | <SchemaAttributeTest>
        | <PITest>
        | <CommentTest>
        | <TextTest>
        | <AnyKindTest>
    };

    rule AnyKindTest { 'node' '(' ')' };
    rule DocumentTest { 
        'document-node' '(' [ <ElementTest> | <SchemaElementTest> ]? ')'
    };
    rule TextTest { 'text' '(' ')' };
    rule CommentTest { 'comment' '(' ')' };
    rule PITest { 'processing-instruction' '(' [ <NCName> | <StringLiteral> ]? ')' };
##[129]    	AttributeTest 	   ::=    	"attribute" "(" (AttribNameOrWildcard ("," TypeName)?)? ")"
    rule AttributeTest { 'attribute' '(' [ AttribNameOrWildcard [ ',' <TypeName> ]? ]? ')' };

##[130]    	AttribNameOrWildcard 	   ::=    	AttributeName | "*"
    token AttribNameOrWildcard { <AttributeName> | '*' };

##[131]    	SchemaAttributeTest 	   ::=    	"schema-attribute" "(" AttributeDeclaration ")"
    rule SchemaAttributeTest { 'schema-attribute' '(' <AttributeDeclaration> ')' };

    rule AttributeDeclaration { <AttributeName> };

##[133]    	ElementTest 	   ::=    	"element" "(" (ElementNameOrWildcard ("," TypeName "?"?)?)? ")"
    rule ElementTest {
        'element' '(' [ <ElementNameOrWildcard> [ ',' <TypeName> '?'? ]? ]? ')'
    };
   
    rule ElementNameOrWildcard { <ElementName> | '*' };

    rule SchemaElementTest { 'schema-element' '(' <ElementDeclaration> ')' };


    token ElementDeclaration { <ElementName> };
    token AttributeName  { <QName> };
    token ElementName    { <QName> };
    token TypeName       { <QName> };

    token URILiteral     { <StringLiteral> };

    token IntegerLiteral { \d+ };
    token DecimalLiteral { '.' \d+ | \d+ '.' \d* };
    token DoubleLiteral  { [ '.' \d+ | \d+ ['.' \d*]? ] <[eE]> <[+\-]>? \d+ };
    
    token StringLiteral  { '"' .*? <before '"'> '"' | <[\']> <-[\']>* <[\']> };

#[145]    	PredefinedEntityRef 	   ::=    	"&" ("lt" | "gt" | "amp" | "quot" | "apos") ";" 	/* ws: explicit */
#[146]    	EscapeQuot 	   ::=    	'""'
#[147]    	EscapeApos 	   ::=    	"''"
#[148]    	ElementContentChar 	   ::=    	Char - [{}<&]
#[149]    	QuotAttrContentChar 	   ::=    	Char - ["{}<&]
#[150]    	AposAttrContentChar 	   ::=    	Char - ['{}<&]
#[151]    	Comment 	   ::=    	"(:" (CommentContents | Comment)* ":)" 	/* ws: explicit */
#				/* gn: comments */
    #token Comment         { '(:' [ <CommentContents> | <Comment> ]*':)' }
    token Comment         { '(:' <CommentContents>? ':)' <cut> }
#[152]    	PITarget 	   ::=    	[http://www.w3.org/TR/REC-xml#NT-PITarget] XML 	/* xgs: xml-version */
#[153]    	CharRef 	   ::=    	[http://www.w3.org/TR/REC-xml#NT-CharRef] XML 	/* xgs: xml-version */
#[154]    	QName 	   ::=    	[http://www.w3.org/TR/REC-xml-names/#NT-QName] Names 	/* xgs: xml-version */
    # LTM
    token QName {
        [
            | <NCName> ':' <NCName>
            | <NCName>
        ]
    };
#[155]    	NCName 	   ::=    	[http://www.w3.org/TR/REC-xml-names/#NT-NCName] Names 	/* xgs: xml-version */
    token NCName {
        [ \w | '-']+
    };
#[156]    	S 	   ::=    	[http://www.w3.org/TR/REC-xml#NT-S] XML 	/* xgs: xml-version */
    token S { \h | \v };

#[157]    	Char 	   ::=    	[http://www.w3.org/TR/REC-xml#NT-Char] XML 	/* xgs: xml-version */

    token CommentContents { .*? <before '(:' | ':)'> };

    token ws_all { <.S> | <.Comment> };

    token ws { 
        || <!S> <ws_all>+ 
        || <ws_all>* 
    };
};

=begin spec

A XQuery Grammar
A.1 EBNF

The grammar of XQuery uses the same simple Extended Backus-Naur Form (EBNF) notation as [XML 1.0] with the following minor differences.

    * All named symbols have a name that begins with an uppercase letter.
    * It adds a notation for referring to productions in external specs.
    * Comments or extra-grammatical constraints on grammar productions are between '/*' and '*/' symbols.
          o A 'xgc:' prefix is an extra-grammatical constraint, the details of which are explained in A.1.2 Extra-grammatical Constraints
          o A 'ws:' prefix explains the whitespace rules for the production, the details of which are explained in A.2.4 Whitespace Rules
          o A 'gn:' prefix means a 'Grammar Note', and is meant as a clarification for parsing rules, and is explained in A.1.3 Grammar Notes. These notes are not normative.

The terminal symbols for this grammar include the quoted strings used in the production rules below, and the terminal symbols defined in section A.2.1 Terminal Symbols.

The EBNF notation is described in more detail in A.1.1 Notation.

To increase readability, the EBNF in the main body of this document omits some of these notational features. This appendix is the normative version of the EBNF.

[1]    	Module 	   ::=    	VersionDecl? (LibraryModule | MainModule)
[2]    	VersionDecl 	   ::=    	"xquery" "version" StringLiteral ("encoding" StringLiteral)? Separator
[3]    	MainModule 	   ::=    	Prolog QueryBody
[4]    	LibraryModule 	   ::=    	ModuleDecl Prolog
[5]    	ModuleDecl 	   ::=    	"module" "namespace" NCName "=" URILiteral Separator
[6]    	Prolog 	   ::=    	((DefaultNamespaceDecl | Setter | NamespaceDecl | Import) Separator)* ((VarDecl | FunctionDecl | OptionDecl) Separator)*
[7]    	Setter 	   ::=    	BoundarySpaceDecl | DefaultCollationDecl | BaseURIDecl | ConstructionDecl | OrderingModeDecl | EmptyOrderDecl | CopyNamespacesDecl
[8]    	Import 	   ::=    	SchemaImport | ModuleImport
[9]    	Separator 	   ::=    	";"
[10]    	NamespaceDecl 	   ::=    	"declare" "namespace" NCName "=" URILiteral
[11]    	BoundarySpaceDecl 	   ::=    	"declare" "boundary-space" ("preserve" | "strip")
[12]    	DefaultNamespaceDecl 	   ::=    	"declare" "default" ("element" | "function") "namespace" URILiteral
[13]    	OptionDecl 	   ::=    	"declare" "option" QName StringLiteral
[14]    	OrderingModeDecl 	   ::=    	"declare" "ordering" ("ordered" | "unordered")
[15]    	EmptyOrderDecl 	   ::=    	"declare" "default" "order" "empty" ("greatest" | "least")
[16]    	CopyNamespacesDecl 	   ::=    	"declare" "copy-namespaces" PreserveMode "," InheritMode
[17]    	PreserveMode 	   ::=    	"preserve" | "no-preserve"
[18]    	InheritMode 	   ::=    	"inherit" | "no-inherit"
[19]    	DefaultCollationDecl 	   ::=    	"declare" "default" "collation" URILiteral
[20]    	BaseURIDecl 	   ::=    	"declare" "base-uri" URILiteral
[21]    	SchemaImport 	   ::=    	"import" "schema" SchemaPrefix? URILiteral ("at" URILiteral ("," URILiteral)*)?
[22]    	SchemaPrefix 	   ::=    	("namespace" NCName "=") | ("default" "element" "namespace")
[23]    	ModuleImport 	   ::=    	"import" "module" ("namespace" NCName "=")? URILiteral ("at" URILiteral ("," URILiteral)*)?
[24]    	VarDecl 	   ::=    	"declare" "variable" "$" QName TypeDeclaration? ((":=" ExprSingle) | "external")
[25]    	ConstructionDecl 	   ::=    	"declare" "construction" ("strip" | "preserve")
[26]    	FunctionDecl 	   ::=    	"declare" "function" QName "(" ParamList? ")" ("as" SequenceType)? (EnclosedExpr | "external")
[27]    	ParamList 	   ::=    	Param ("," Param)*
[28]    	Param 	   ::=    	"$" QName TypeDeclaration?
[29]    	EnclosedExpr 	   ::=    	"{" Expr "}"
[30]    	QueryBody 	   ::=    	Expr
[31]    	Expr 	   ::=    	ExprSingle ("," ExprSingle)*
[32]    	ExprSingle 	   ::=    	FLWORExpr
| QuantifiedExpr
| TypeswitchExpr
| IfExpr
| OrExpr
[33]    	FLWORExpr 	   ::=    	(ForClause | LetClause)+ WhereClause? OrderByClause? "return" ExprSingle
[34]    	ForClause 	   ::=    	"for" "$" VarName TypeDeclaration? PositionalVar? "in" ExprSingle ("," "$" VarName TypeDeclaration? PositionalVar? "in" ExprSingle)*
[35]    	PositionalVar 	   ::=    	"at" "$" VarName
[36]    	LetClause 	   ::=    	"let" "$" VarName TypeDeclaration? ":=" ExprSingle ("," "$" VarName TypeDeclaration? ":=" ExprSingle)*
[37]    	WhereClause 	   ::=    	"where" ExprSingle
[38]    	OrderByClause 	   ::=    	(("order" "by") | ("stable" "order" "by")) OrderSpecList
[39]    	OrderSpecList 	   ::=    	OrderSpec ("," OrderSpec)*
[40]    	OrderSpec 	   ::=    	ExprSingle OrderModifier
[41]    	OrderModifier 	   ::=    	("ascending" | "descending")? ("empty" ("greatest" | "least"))? ("collation" URILiteral)?
[42]    	QuantifiedExpr 	   ::=    	("some" | "every") "$" VarName TypeDeclaration? "in" ExprSingle ("," "$" VarName TypeDeclaration? "in" ExprSingle)* "satisfies" ExprSingle
[43]    	TypeswitchExpr 	   ::=    	"typeswitch" "(" Expr ")" CaseClause+ "default" ("$" VarName)? "return" ExprSingle
[44]    	CaseClause 	   ::=    	"case" ("$" VarName "as")? SequenceType "return" ExprSingle
[45]    	IfExpr 	   ::=    	"if" "(" Expr ")" "then" ExprSingle "else" ExprSingle
[46]    	OrExpr 	   ::=    	AndExpr ( "or" AndExpr )*
[47]    	AndExpr 	   ::=    	ComparisonExpr ( "and" ComparisonExpr )*
[48]    	ComparisonExpr 	   ::=    	RangeExpr ( (ValueComp
| GeneralComp
| NodeComp) RangeExpr )?
[49]    	RangeExpr 	   ::=    	AdditiveExpr ( "to" AdditiveExpr )?
[50]    	AdditiveExpr 	   ::=    	MultiplicativeExpr ( ("+" | "-") MultiplicativeExpr )*
[51]    	MultiplicativeExpr 	   ::=    	UnionExpr ( ("*" | "div" | "idiv" | "mod") UnionExpr )*
[52]    	UnionExpr 	   ::=    	IntersectExceptExpr ( ("union" | "|") IntersectExceptExpr )*
[53]    	IntersectExceptExpr 	   ::=    	InstanceofExpr ( ("intersect" | "except") InstanceofExpr )*
[54]    	InstanceofExpr 	   ::=    	TreatExpr ( "instance" "of" SequenceType )?
[55]    	TreatExpr 	   ::=    	CastableExpr ( "treat" "as" SequenceType )?
[56]    	CastableExpr 	   ::=    	CastExpr ( "castable" "as" SingleType )?
[57]    	CastExpr 	   ::=    	UnaryExpr ( "cast" "as" SingleType )?
[58]    	UnaryExpr 	   ::=    	("-" | "+")* ValueExpr
[59]    	ValueExpr 	   ::=    	ValidateExpr | PathExpr | ExtensionExpr
[60]    	GeneralComp 	   ::=    	"=" | "!=" | "<" | "<=" | ">" | ">="
[61]    	ValueComp 	   ::=    	"eq" | "ne" | "lt" | "le" | "gt" | "ge"
[62]    	NodeComp 	   ::=    	"is" | "<<" | ">>"
[63]    	ValidateExpr 	   ::=    	"validate" ValidationMode? "{" Expr "}"
[64]    	ValidationMode 	   ::=    	"lax" | "strict"
[65]    	ExtensionExpr 	   ::=    	Pragma+ "{" Expr? "}"
[66]    	Pragma 	   ::=    	"(#" S? QName (S PragmaContents)? "#)" 	/* ws: explicit */
[67]    	PragmaContents 	   ::=    	(Char* - (Char* '#)' Char*))
[68]    	PathExpr 	   ::=    	("/" RelativePathExpr?)
| ("//" RelativePathExpr)
| RelativePathExpr 	/* xgs: leading-lone-slash */
[69]    	RelativePathExpr 	   ::=    	StepExpr (("/" | "//") StepExpr)*
[70]    	StepExpr 	   ::=    	FilterExpr | AxisStep
[71]    	AxisStep 	   ::=    	(ReverseStep | ForwardStep) PredicateList
[72]    	ForwardStep 	   ::=    	(ForwardAxis NodeTest) | AbbrevForwardStep
[73]    	ForwardAxis 	   ::=    	("child" "::")
| ("descendant" "::")
| ("attribute" "::")
| ("self" "::")
| ("descendant-or-self" "::")
| ("following-sibling" "::")
| ("following" "::")
[74]    	AbbrevForwardStep 	   ::=    	"@"? NodeTest
[75]    	ReverseStep 	   ::=    	(ReverseAxis NodeTest) | AbbrevReverseStep
[76]    	ReverseAxis 	   ::=    	("parent" "::")
| ("ancestor" "::")
| ("preceding-sibling" "::")
| ("preceding" "::")
| ("ancestor-or-self" "::")
[77]    	AbbrevReverseStep 	   ::=    	".."
[78]    	NodeTest 	   ::=    	KindTest | NameTest
[79]    	NameTest 	   ::=    	QName | Wildcard
[80]    	Wildcard 	   ::=    	"*"
| (NCName ":" "*")
| ("*" ":" NCName) 	/* ws: explicit */
[81]    	FilterExpr 	   ::=    	PrimaryExpr PredicateList
[82]    	PredicateList 	   ::=    	Predicate*
[83]    	Predicate 	   ::=    	"[" Expr "]"
[84]    	PrimaryExpr 	   ::=    	Literal | VarRef | ParenthesizedExpr | ContextItemExpr | FunctionCall | OrderedExpr | UnorderedExpr | Constructor
[85]    	Literal 	   ::=    	NumericLiteral | StringLiteral
[86]    	NumericLiteral 	   ::=    	IntegerLiteral | DecimalLiteral | DoubleLiteral
[87]    	VarRef 	   ::=    	"$" VarName
[88]    	VarName 	   ::=    	QName
[89]    	ParenthesizedExpr 	   ::=    	"(" Expr? ")"
[90]    	ContextItemExpr 	   ::=    	"."
[91]    	OrderedExpr 	   ::=    	"ordered" "{" Expr "}"
[92]    	UnorderedExpr 	   ::=    	"unordered" "{" Expr "}"
[93]    	FunctionCall 	   ::=    	QName "(" (ExprSingle ("," ExprSingle)*)? ")" 	/* xgs: reserved-function-names */
				/* gn: parens */
[94]    	Constructor 	   ::=    	DirectConstructor
| ComputedConstructor
[95]    	DirectConstructor 	   ::=    	DirElemConstructor
| DirCommentConstructor
| DirPIConstructor
[96]    	DirElemConstructor 	   ::=    	"<" QName DirAttributeList ("/>" | (">" DirElemContent* "</" QName S? ">")) 	/* ws: explicit */
[97]    	DirAttributeList 	   ::=    	(S (QName S? "=" S? DirAttributeValue)?)* 	/* ws: explicit */
[98]    	DirAttributeValue 	   ::=    	('"' (EscapeQuot | QuotAttrValueContent)* '"')
| ("'" (EscapeApos | AposAttrValueContent)* "'") 	/* ws: explicit */
[99]    	QuotAttrValueContent 	   ::=    	QuotAttrContentChar
| CommonContent
[100]    	AposAttrValueContent 	   ::=    	AposAttrContentChar
| CommonContent
[101]    	DirElemContent 	   ::=    	DirectConstructor
| CDataSection
| CommonContent
| ElementContentChar
[102]    	CommonContent 	   ::=    	PredefinedEntityRef | CharRef | "{{" | "}}" | EnclosedExpr
[103]    	DirCommentConstructor 	   ::=    	"<!--" DirCommentContents "-->" 	/* ws: explicit */
[104]    	DirCommentContents 	   ::=    	((Char - '-') | ('-' (Char - '-')))* 	/* ws: explicit */
[105]    	DirPIConstructor 	   ::=    	"<?" PITarget (S DirPIContents)? "?>" 	/* ws: explicit */
[106]    	DirPIContents 	   ::=    	(Char* - (Char* '?>' Char*)) 	/* ws: explicit */
[107]    	CDataSection 	   ::=    	"<![CDATA[" CDataSectionContents "]]>" 	/* ws: explicit */
[108]    	CDataSectionContents 	   ::=    	(Char* - (Char* ']]>' Char*)) 	/* ws: explicit */
[109]    	ComputedConstructor 	   ::=    	CompDocConstructor
| CompElemConstructor
| CompAttrConstructor
| CompTextConstructor
| CompCommentConstructor
| CompPIConstructor
[110]    	CompDocConstructor 	   ::=    	"document" "{" Expr "}"
[111]    	CompElemConstructor 	   ::=    	"element" (QName | ("{" Expr "}")) "{" ContentExpr? "}"
[112]    	ContentExpr 	   ::=    	Expr
[113]    	CompAttrConstructor 	   ::=    	"attribute" (QName | ("{" Expr "}")) "{" Expr? "}"
[114]    	CompTextConstructor 	   ::=    	"text" "{" Expr "}"
[115]    	CompCommentConstructor 	   ::=    	"comment" "{" Expr "}"
[116]    	CompPIConstructor 	   ::=    	"processing-instruction" (NCName | ("{" Expr "}")) "{" Expr? "}"
[117]    	SingleType 	   ::=    	AtomicType "?"?
[118]    	TypeDeclaration 	   ::=    	"as" SequenceType
[119]    	SequenceType 	   ::=    	("empty-sequence" "(" ")")
| (ItemType OccurrenceIndicator?)
[120]    	OccurrenceIndicator 	   ::=    	"?" | "*" | "+" 	/* xgs: occurrence-indicators */
[121]    	ItemType 	   ::=    	KindTest | ("item" "(" ")") | AtomicType
[122]    	AtomicType 	   ::=    	QName
[123]    	KindTest 	   ::=    	DocumentTest
| ElementTest
| AttributeTest
| SchemaElementTest
| SchemaAttributeTest
| PITest
| CommentTest
| TextTest
| AnyKindTest
[124]    	AnyKindTest 	   ::=    	"node" "(" ")"
[125]    	DocumentTest 	   ::=    	"document-node" "(" (ElementTest | SchemaElementTest)? ")"
[126]    	TextTest 	   ::=    	"text" "(" ")"
[127]    	CommentTest 	   ::=    	"comment" "(" ")"
[128]    	PITest 	   ::=    	"processing-instruction" "(" (NCName | StringLiteral)? ")"
[129]    	AttributeTest 	   ::=    	"attribute" "(" (AttribNameOrWildcard ("," TypeName)?)? ")"
[130]    	AttribNameOrWildcard 	   ::=    	AttributeName | "*"
[131]    	SchemaAttributeTest 	   ::=    	"schema-attribute" "(" AttributeDeclaration ")"
[132]    	AttributeDeclaration 	   ::=    	AttributeName
[133]    	ElementTest 	   ::=    	"element" "(" (ElementNameOrWildcard ("," TypeName "?"?)?)? ")"
[134]    	ElementNameOrWildcard 	   ::=    	ElementName | "*"
[135]    	SchemaElementTest 	   ::=    	"schema-element" "(" ElementDeclaration ")"
[136]    	ElementDeclaration 	   ::=    	ElementName
[137]    	AttributeName 	   ::=    	QName
[138]    	ElementName 	   ::=    	QName
[139]    	TypeName 	   ::=    	QName
[140]    	URILiteral 	   ::=    	StringLiteral
A.1.1 Notation

The following definitions will be helpful in defining precisely this exposition.

[Definition: Each rule in the grammar defines one symbol, using the following format:

symbol ::= expression

]

[Definition: A terminal is a symbol or string or pattern that can appear in the right-hand side of a rule, but never appears on the left hand side in the main grammar, although it may appear on the left-hand side of a rule in the grammar for terminals.] The following constructs are used to match strings of one or more characters in a terminal:

[a-zA-Z]

    matches any Char with a value in the range(s) indicated (inclusive).
[abc]

    matches any Char with a value among the characters enumerated.
[^abc]

    matches any Char with a value not among the characters given.
"string"

    matches the sequence of characters that appear inside the double quotes.
'string'

    matches the sequence of characters that appear inside the single quotes.
[http://www.w3.org/TR/REC-example/#NT-Example]

    matches any string matched by the production defined in the external specification as per the provided reference.

Patterns (including the above constructs) can be combined with grammatical operators to form more complex patterns, matching more complex sets of character strings. In the examples that follow, A and B represent (sub-)patterns.

(A)

    A is treated as a unit and may be combined as described in this list.
A?

    matches A or nothing; optional A.
A B

    matches A followed by B. This operator has higher precedence than alternation; thus A B | C D is identical to (A B) | (C D).
A | B

    matches A or B but not both.
A - B

    matches any string that matches A but does not match B.
A+

    matches one or more occurrences of A. Concatenation has higher precedence than alternation; thus A+ | B+ is identical to (A+) | (B+).

A*

    matches zero or more occurrences of A. Concatenation has higher precedence than alternation; thus A* | B* is identical to (A*) | (B*)

A.1.2 Extra-grammatical Constraints

This section contains constraints on the EBNF productions, which are required to parse legal sentences. The notes below are referenced from the right side of the production, with the notation: /* xgc: <id> */.

Constraint: leading-lone-slash

A single slash may appear either as a complete path expression or as the first part of a path expression in which it is followed by a RelativePathExpr, which can take the form of a NameTest ("*" or a QName). In contexts where operators like "*", "union", etc., can occur, parsers may have difficulty distinguishing operators from NameTests. For example, without lookahead the first part of the expression "/ * 5", for example is easily taken to be a complete expression, "/ *", which has a very different interpretation (the child nodes of "/").

To reduce the need for lookahead, therefore, if the token immediately following a slash is "*" or a keyword, then the slash must be the beginning, but not the entirety, of a PathExpr (and the following token must be a NameTest, not an operator).

A single slash may be used as the left-hand argument of an operator by parenthesizing it: (/) * 5. The expression 5 * /, on the other hand, is legal without parentheses.

Constraint: xml-version

An implementation's choice to support the [XML 1.0] and [XML Names], or [XML 1.1] and [XML Names 1.1] lexical specification determines the external document from which to obtain the definition for this production. The EBNF only has references to the 1.0 versions. In some cases, the XML 1.0 and XML 1.1 definitions may be exactly the same. Also please note that these external productions follow the whitespace rules of their respective specifications, and not the rules of this specification, in particular A.2.4.1 Default Whitespace Handling. Thus prefix : localname is not a valid QName for purposes of this specification, just as it is not permitted in a XML document. Also, comments are not permissible on either side of the colon. Also extra-grammatical constraints such as well-formedness constraints must be taken into account.

Constraint: reserved-function-names

Unprefixed function names spelled the same way as language keywords could make the language harder to recognize. For instance, if(foo) could be taken either as a FunctionCall or as the beginning of an IfExpr. Therefore it is not legal syntax for a user to invoke functions with unprefixed names which match any of the names in A.3 Reserved Function Names.

A function named "if" can be called by binding its namespace to a prefix and using the prefixed form: "library:if(foo)" instead of "if(foo)".

Constraint: occurrence-indicators

As written, the grammar in A XQuery Grammar is ambiguous for some forms using the '+' and '*' Kleene operators. The ambiguity is resolved as follows: these operators are tightly bound to the SequenceType expression, and have higher precedence than other uses of these symbols. Any occurrence of '+' and '*', as well as '?', following a sequence type is assumed to be an occurrence indicator. That is, a "+", "*", or "?" immediately following an ItemType must be an OccurrenceIndicator. Thus, 4 treat as item() + - 5 must be interpreted as (4 treat as item()+) - 5, taking the '+' as an OccurrenceIndicator and the '-' as a subtraction operator. To force the interpretation of "+" as an addition operator (and the corresponding interpretation of the "-" as a unary minus), parentheses may be used: the form (4 treat as item()) + -5 surrounds the SequenceType expression with parentheses and leads to the desired interpretation.

This rule has as a consequence that certain forms which would otherwise be legal and unambiguous are not recognized: in "4 treat as item() + 5", the "+" is taken as an OccurrenceIndicator, and not as an operator, which means this is not a legal expression.
A.1.3 Grammar Notes

This section contains general notes on the EBNF productions, which may be helpful in understanding how to interpret and implement the EBNF. These notes are not normative. The notes below are referenced from the right side of the production, with the notation: /* gn: <id> */.

Note:

grammar-note: parens

    Look-ahead is required to distinguish FunctionCall from a QName or keyword followed by a Pragma or Comment. For example: address (: this may be empty :) may be mistaken for a call to a function named "address" unless this lookahead is employed. Another example is for (: whom the bell :) $tolls in 3 return $tolls, where the keyword "for" must not be mistaken for a function name.
grammar-note: comments

    Comments are allowed everywhere that ignorable whitespace is allowed, and the Comment symbol does not explicity appear on the right-hand side of the grammar (except in its own production). See A.2.4.1 Default Whitespace Handling. Note that comments are not allowed in direct constructor content, though they are allowed in nested EnclosedExprs.

    A comment can contain nested comments, as long as all "(:" and ":)" patterns are balanced, no matter where they occur within the outer comment.

    Note:

    Lexical analysis may typically handle nested comments by incrementing a counter for each "(:" pattern, and decrementing the counter for each ":)" pattern. The comment does not terminate until the counter is back to zero.

    Some illustrative examples:

        *

          (: commenting out a (: comment :) may be confusing, but often helpful :) is a legal Comment, since balanced nesting of comments is allowed.
        *

          "this is just a string :)" is a legal expression. However, (: "this is just a string :)" :) will cause a syntax error. Likewise, "this is another string (:" is a legal expression, but (: "this is another string (:" :) will cause a syntax error. It is a limitation of nested comments that literal content can cause unbalanced nesting of comments.
        *

          for (: set up loop :) $i in $x return $i is syntactically legal, ignoring the comment.
        *

          5 instance (: strange place for a comment :) of xs:integer is also syntactically legal.
        *

          <eg (: an example:)>{$i//title}</eg> is not syntactically legal.
        *

          <eg> (: an example:) </eg> is syntactically legal, but the characters that look like a comment are in fact literal element content.

A.2 Lexical structure

The terminal symbols assumed by the grammar above are described in this section.

Quoted strings appearing in production rules are terminal symbols.

Other terminal symbols are defined in A.2.1 Terminal Symbols.

It is implementation-defined whether the lexical rules of [XML 1.0] and [XML Names] are followed, or alternatively, the lexical rules of [XML 1.1] and [XML Names 1.1] are followed. Implementations that support the full [XML 1.1] character set SHOULD, for purposes of interoperability, provide a mode that follows only the [XML 1.0] and [XML Names] lexical rules.

When tokenizing, the longest possible match that is valid in the current context is used.

All keywords are case sensitive. Keywords are not reserved—that is, any QName may duplicate a keyword except as noted in A.3 Reserved Function Names.
A.2.1 Terminal Symbols
[141]    	IntegerLiteral 	   ::=    	Digits
[142]    	DecimalLiteral 	   ::=    	("." Digits) | (Digits "." [0-9]*) 	/* ws: explicit */
[143]    	DoubleLiteral 	   ::=    	(("." Digits) | (Digits ("." [0-9]*)?)) [eE] [+-]? Digits 	/* ws: explicit */
[144]    	StringLiteral 	   ::=    	('"' (PredefinedEntityRef | CharRef | EscapeQuot | [^"&])* '"') | ("'" (PredefinedEntityRef | CharRef | EscapeApos | [^'&])* "'") 	/* ws: explicit */
[145]    	PredefinedEntityRef 	   ::=    	"&" ("lt" | "gt" | "amp" | "quot" | "apos") ";" 	/* ws: explicit */
[146]    	EscapeQuot 	   ::=    	'""'
[147]    	EscapeApos 	   ::=    	"''"
[148]    	ElementContentChar 	   ::=    	Char - [{}<&]
[149]    	QuotAttrContentChar 	   ::=    	Char - ["{}<&]
[150]    	AposAttrContentChar 	   ::=    	Char - ['{}<&]
[151]    	Comment 	   ::=    	"(:" (CommentContents | Comment)* ":)" 	/* ws: explicit */
				/* gn: comments */
[152]    	PITarget 	   ::=    	[http://www.w3.org/TR/REC-xml#NT-PITarget] XML 	/* xgs: xml-version */
[153]    	CharRef 	   ::=    	[http://www.w3.org/TR/REC-xml#NT-CharRef] XML 	/* xgs: xml-version */
[154]    	QName 	   ::=    	[http://www.w3.org/TR/REC-xml-names/#NT-QName] Names 	/* xgs: xml-version */
[155]    	NCName 	   ::=    	[http://www.w3.org/TR/REC-xml-names/#NT-NCName] Names 	/* xgs: xml-version */
[156]    	S 	   ::=    	[http://www.w3.org/TR/REC-xml#NT-S] XML 	/* xgs: xml-version */
[157]    	Char 	   ::=    	[http://www.w3.org/TR/REC-xml#NT-Char] XML 	/* xgs: xml-version */

The following symbols are used only in the definition of terminal symbols; they are not terminal symbols in the grammar of A.1 EBNF.
[158]    	Digits 	   ::=    	[0-9]+
[159]    	CommentContents 	   ::=    	(Char+ - (Char* ('(:' | ':)') Char*))
A.2.2 Terminal Delimitation

XQuery 1.0 expressions consist of terminal symbols and symbol separators.

Terminal symbols that are not used exclusively in /* ws: explicit */ productions are of two kinds: delimiting and non-delimiting.

[Definition: The delimiting terminal symbols are: S, "-", (comma), (semi-colon), (colon), "::", ":=", "!=", "?", "?>", "/", "//", "/>", (dot), "..", StringLiteral, "(", "(#", ")", "[", "]", "]]>", "{", "}", "@", "$", "*", "#)", "+", "<", "<!--", "<![CDATA[", "<?", "</", "<<", "<=", "=", ">", "-->", ">=", ">>", "|"]

[Definition: The non-delimiting terminal symbols are: IntegerLiteral, NCName, QName, DecimalLiteral, DoubleLiteral, "ancestor", "ancestor-or-self", "and", "as", "ascending", "at", "attribute", "base-uri", "boundary-space", "by", "case", "cast", "castable", "child", "collation", "comment", "construction", "copy-namespaces", "declare", "default", "descendant", "descendant-or-self", "descending", "div", "document", "document-node", "element", "else", "empty", "empty-sequence", "encoding", "eq", "every", "except", "external", "following", "following-sibling", "for", "function", "ge", "greatest", "gt", "idiv", "if", "import", "in", "inherit", "instance", "intersect", "is", "item", "lax", "le", "least", "let", "lt", "mod", "module", "namespace", "ne", "node", "no-inherit", "no-preserve", "of", "option", "or", "order", "ordered", "ordering", "parent", "preceding", "preceding-sibling", "preserve", "processing-instruction", "return", "satisfies", "schema", "schema-attribute", "schema-element", "self", "some", "stable", "strict", "strip", "text", "then", "to", "treat", "typeswitch", "union", "unordered", "validate", "variable", "version", "where", "xquery"]

[Definition: Whitespace and Comments function as symbol separators. For the most part, they are not mentioned in the grammar, and may occur between any two terminal symbols mentioned in the grammar, except where that is forbidden by the /* ws: explicit */ annotation in the EBNF, or by the /* xgs: xml-version */ annotation. ]

It is customary to separate consecutive terminal symbols by whitespace and Comments, but this is required only when otherwise two non-delimiting symbols would be adjacent to each other. There are two exceptions to this, that of "." and "-", which do require a symbol separator if they follow a QName or NCName. Also, "." requires a separator if it precedes or follows a numeric literal.
A.2.3 End-of-Line Handling

The XQuery processor must behave as if it normalized all line breaks on input, before parsing. The normalization should be done according to the choice to support either [XML 1.0] or [XML 1.1] lexical processing.
A.2.3.1 XML 1.0 End-of-Line Handling

For [XML 1.0] processing, all of the following must be translated to a single #xA character:

   1.

      the two-character sequence #xD #xA
   2.

      any #xD character that is not immediately followed by #xA.

A.2.3.2 XML 1.1 End-of-Line Handling

For [XML 1.1] processing, all of the following must be translated to a single #xA character:

   1.

      the two-character sequence #xD #xA
   2.

      the two-character sequence #xD #x85
   3.

      the single character #x85
   4.

      the single character #x2028
   5.

      any #xD character that is not immediately followed by #xA or #x85.

The characters #x85 and #x2028 cannot be reliably recognized and translated until the VersionDecl declaration (if present) has been read.
A.2.4 Whitespace Rules
A.2.4.1 Default Whitespace Handling

[Definition: A whitespace character is any of the characters defined by [http://www.w3.org/TR/REC-xml#NT-S].]

[Definition: Ignorable whitespace consists of any whitespace characters that may occur between terminals, unless these characters occur in the context of a production marked with a ws:explicit annotation, in which case they can occur only where explicitly specified (see A.2.4.2 Explicit Whitespace Handling).] Ignorable whitespace characters are not significant to the semantics of an expression. Whitespace is allowed before the first terminal and after the last terminal of a module. Whitespace is allowed between any two terminals. Comments may also act as "whitespace" to prevent two adjacent terminals from being recognized as one. Some illustrative examples are as follows:

    *

      foo- foo results in a syntax error. "foo-" would be recognized as a QName.
    *

      foo -foo is syntactically equivalent to foo - foo, two QNames separated by a subtraction operator.
    *

      foo(: This is a comment :)- foo is syntactically equivalent to foo - foo. This is because the comment prevents the two adjacent terminals from being recognized as one.
    *

      foo-foo is syntactically equivalent to single QName. This is because "-" is a valid character in a QName. When used as an operator after the characters of a name, the "-" must be separated from the name, e.g. by using whitespace or parentheses.
    *

      10div 3 results in a syntax error.
    *

      10 div3 also results in a syntax error.
    *

      10div3 also results in a syntax error.

A.2.4.2 Explicit Whitespace Handling

Explicit whitespace notation is specified with the EBNF productions, when it is different from the default rules, using the notation shown below. This notation is not inherited. In other words, if an EBNF rule is marked as /* ws: explicit */, the notation does not automatically apply to all the 'child' EBNF productions of that rule.

ws: explicit

    /* ws: explicit */ means that the EBNF notation explicitly notates, with S or otherwise, where whitespace characters are allowed. In productions with the /* ws: explicit */ annotation, A.2.4.1 Default Whitespace Handling does not apply. Comments are also not allowed in these productions.

For example, whitespace is not freely allowed by the direct constructor productions, but is specified explicitly in the grammar, in order to be more consistent with XML.
A.3 Reserved Function Names

The following names are not allowed as function names in an unprefixed form because expression syntax takes precedence.

    *

      attribute
    *

      comment
    *

      document-node
    *

      element
    *

      empty-sequence
    *

      if
    *

      item
    *

      node
    *

      processing-instruction
    *

      schema-attribute
    *

      schema-element
    *

      text
    *

      typeswitch

A.4 Precedence Order

The grammar in A.1 EBNF normatively defines built-in precedence among the operators of XQuery. These operators are summarized here to make clear the order of their precedence from lowest to highest. Operators that have a lower precedence number cannot be contained by operators with a higher precedence number. The associativity column indicates the order in which operators of equal precedence in an expression are applied.
# 	Operator 	Associativity
1 	, (comma) 	left-to-right
2 	:= (assignment) 	right-to-left
3 	for, some, every, typeswitch, if 	left-to-right
4 	or 	left-to-right
5 	and 	left-to-right
6 	eq, ne, lt, le, gt, ge, =, !=, <, <=, >, >=, is, <<, >> 	left-to-right
7 	to 	left-to-right
8 	+, - 	left-to-right
9 	*, div, idiv, mod 	left-to-right
10 	union, | 	left-to-right
11 	intersect, except 	left-to-right
12 	instance of 	left-to-right
13 	treat 	left-to-right
14 	castable 	left-to-right
15 	cast 	left-to-right
16 	-(unary), +(unary) 	right-to-left
17 	?, *(OccurrenceIndicator), +(OccurrenceIndicator) 	left-to-right
18 	/, // 	left-to-right
19 	[ ], ( ), {} 	left-to-right
=end spec

# vim: ft=perl6
