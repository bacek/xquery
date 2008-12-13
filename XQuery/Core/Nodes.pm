use v6;

=begin pod

Base class for Core

=end pod

class XQuery::Core::Node {
    has $.right is rw;
    has $.left is rw;
    method right { $.right };
    method left  { $.left };

    method dump ( $level = 0) {
        say '  ' x $level, self;
        if (self.right) {
            self.right.dump(1+$level);
        }
        if (self.left) {
            self.left.dump($level);
        }
    };
};


#[1]    	ModuleDecl 	   ::=    	"module" "namespace" NCName "=" URILiteral Separator
#[2]    	Separator 	   ::=    	";"
#[3]    	NamespaceDecl 	   ::=    	"declare" "namespace" NCName "=" URILiteral
#[4]    	DefaultNamespaceDecl 	   ::=    	"declare" "default" ("element" | "function") "namespace" URILiteral
#[5]    	OptionDecl 	   ::=    	"declare" "option" QName StringLiteral
#[6]    	OrderingModeDecl 	   ::=    	"declare" "ordering" ("ordered" | "unordered")
#[7]    	EmptyOrderDecl 	   ::=    	"declare" "default" "order" "empty" ("greatest" | "least")
#[8]    	CopyNamespacesDecl 	   ::=    	"declare" "copy-namespaces" PreserveMode "," InheritMode
#[9]    	PreserveMode 	   ::=    	"preserve" | "no-preserve"
#[10]    	InheritMode 	   ::=    	"inherit" | "no-inherit"
#[11]    	DefaultCollationDecl 	   ::=    	"declare" "default" "collation" URILiteral
#[12]    	BaseURIDecl 	   ::=    	"declare" "base-uri" URILiteral
#[13]    	SchemaImport 	   ::=    	"import" "schema" SchemaPrefix? URILiteral ("at" URILiteral ("," URILiteral)*)?
#[14]    	SchemaPrefix 	   ::=    	("namespace" NCName "=") | ("default" "element" "namespace")
#[15]    	ModuleImport 	   ::=    	"import" "module" ("namespace" NCName "=")? URILiteral ("at" URILiteral ("," URILiteral)*)?
#[16]    	VarDecl 	   ::=    	"declare" "variable" "$" QName TypeDeclaration? ((":=" ExprSingle) | "external")
#[17]    	ConstructionDecl 	   ::=    	"declare" "construction" ("strip" | "preserve")
#[18]    	FunctionDecl 	   ::=    	"declare" "function" QName "(" ParamList? ")" ("as" SequenceType)? (EnclosedExpr | "external")
#[19]    	ParamList 	   ::=    	Param ("," Param)*
#[20]    	Param 	   ::=    	"$" QName TypeDeclaration?
#[21]    	EnclosedExpr 	   ::=    	"{" Expr "}"
#[22]    	Expr 	   ::=    	ExprSingle ("," ExprSingle)*
class XQuery::Core::Expr is XQuery::Core::Node {
    has @.expr_single;
};

#[23]    	ExprSingle 	   ::=    	FLWORExpr
#| QuantifiedExpr
#| TypeswitchExpr
#| IfExpr
#| OrExpr
class XQuery::Core::ExprSingle is XQuery::Core::Node {
    has $.left;
};

#[24]    	FLWORExpr 	   ::=    	(ForClause | LetClause) "return" ExprSingle
class XQuery::Core::FLWORExpr is XQuery::Core::ExprSingle {
    has $.clause;
    has $.return;
    has $.left; # XXX
};

class XQuery::Core::ForVars is XQuery::Core::Node {
    has $.bound_var is rw;
    has $.positional_var is rw;
}

#[25]    	ForClause 	   ::=    	"for" "$" VarName TypeDeclaration? PositionalVar? "in" ExprSingle
#  (for (for_vars (var) (var)) (in))
class XQuery::Core::ForClause is XQuery::Core::Node {
    has $.var_name is rw;
    has $.type_declaration is rw;
    has $.positional_var is rw;
    has $.in is rw;

    has $!vars is rw;

    method BUILD {
        $!vars = XQuery::Core::ForVars.new(
            bound_var      => $.var_name,
            positional_var => $.positional_var,
        );
        $!vars.right = $.in;
        $.right = $!vars;
    }
};

#[26]    	PositionalVar 	   ::=    	"at" "$" VarName
#[27]    	LetClause 	   ::=    	"let" "$" VarName TypeDeclaration? ":=" ExprSingle
class XQuery::Core::LetClause is XQuery::Core::Node {
    has $.var_name;
    has $.type_declaration;
    has $.bound_expr;

    method right { $.bound_expr };
};

#[28]    	OrderByClause 	   ::=    	(("order" "by") | ("stable" "order" "by")) OrderSpecList
class XQuery::Core::OrderByClause is XQuery::Core::Node {
    has $.is_stable;
    has @.order_spec;
};

#[29]    	OrderSpecList 	   ::=    	OrderSpec ("," OrderSpec)*
#[30]    	OrderSpec 	   ::=    	ExprSingle OrderModifier
class XQuery::Core::OrderSpec is XQuery::Core::Node {
    has $.expr_single;
};

#[31]    	OrderModifier 	   ::=    	("ascending" | "descending")? ("empty" ("greatest" | "least"))? ("collation" URILiteral)?

#[32]    	QuantifiedExpr 	   ::=    	("some" | "every") "$" VarName TypeDeclaration? "in" ExprSingle ("," "$" VarName TypeDeclaration? "in" ExprSingle)* "satisfies" ExprSingle
class XQuery::Core::QuantifiedExpr is XQuery::Core::Node {
};

#[33]    	TypeswitchExpr 	   ::=    	"typeswitch" "(" Expr ")" CaseClause+ "default" "$" VarName "return" ExprSingle
class XQuery::Core::TypeswitchExpr is XQuery::Core::Node {
};

#[34]    	CaseClause 	   ::=    	"case" "$" VarName "as" SequenceType "return" ExprSingle
class XQuery::Core::CaseClause is XQuery::Core::Node {
    has $.var_name;
    has $.sequence_type;
    has $.return;
};

#[35]    	IfExpr 	   ::=    	"if" "(" Expr ")" "then" ExprSingle "else" ExprSingle
class XQuery::Core::IfExpr is XQuery::Core::Node {
    has $.test;
    has $.then;
    has $.else;
};

#[36]    	OrExpr 	   ::=    	AndExpr ( "or" AndExpr )*
class XQuery::Core::OrExpr is XQuery::Core::Node {
    has @.expr is rw;
};

#[37]    	AndExpr 	   ::=    	CastableExpr ( "and" CastableExpr )*
#[38]    	CastableExpr 	   ::=    	CastExpr ( "castable" "as" SingleType )?
#[39]    	CastExpr 	   ::=    	ValueExpr ( "cast" "as" SingleType )?
#[40]    	ValueExpr 	   ::=    	ValidateExpr | StepExpr | ExtensionExpr
#[41]    	ValidateExpr 	   ::=    	"validate" ValidationMode? "{" Expr "}"
#[42]    	ValidationMode 	   ::=    	"lax" | "strict"
#[43]    	ExtensionExpr 	   ::=    	Pragma+ "{" Expr? "}"
#[44]    	Pragma 	   ::=    	"(#" S? QName (S PragmaContents)? "#)"
#[45]    	PragmaContents 	   ::=    	(Char* - (Char* '#)' Char*))
#[46]    	StepExpr 	   ::=    	PrimaryExpr | AxisStep
#[47]    	AxisStep 	   ::=    	ReverseStep | ForwardStep
#[48]    	ForwardStep 	   ::=    	ForwardAxis NodeTest

#[49]    	ForwardAxis 	   ::=    	("child" "::")
#| ("descendant" "::")
#| ("attribute" "::")
#| ("self" "::")
#| ("descendant-or-self" "::")
#| ("namespace" "::")
enum XQuery::Core::Axis<
    child
    descendant
    attribute
    self
    descendant_or_self
    namespace

    parent
    ancestor
    ancestor_or_self
>;

#[50]    	ReverseStep 	   ::=    	ReverseAxis NodeTest
#[51]    	ReverseAxis 	   ::=    	("parent" "::")
#| ("ancestor" "::")
#| ("ancestor-or-self" "::")
#[52]    	NodeTest 	   ::=    	KindTest | NameTest
#[53]    	NameTest 	   ::=    	QName | Wildcard
#[54]    	Wildcard 	   ::=    	"*"
#| (NCName ":" "*")
#| ("*" ":" NCName)
#[55]    	PrimaryExpr 	   ::=    	Literal | VarRef | ParenthesizedExpr | FunctionCall | OrderedExpr | UnorderedExpr | Constructor
#[56]    	Literal 	   ::=    	NumericLiteral | StringLiteral
class XQuery::Core::Literal is XQuery::Core::Node {
    has $.value;

    method Str {
        'Literal[' ~ $.value ~ ']';
    }
};

#[57]    	NumericLiteral 	   ::=    	IntegerLiteral | DecimalLiteral | DoubleLiteral
#[58]    	VarRef 	   ::=    	"$" VarName
#[59]    	VarName 	   ::=    	QName
#[60]    	ParenthesizedExpr 	   ::=    	"(" Expr? ")"
#[61]    	OrderedExpr 	   ::=    	"ordered" "{" Expr "}"
#[62]    	UnorderedExpr 	   ::=    	"unordered" "{" Expr "}"
#[63]    	FunctionCall 	   ::=    	QName "(" (ExprSingle ("," ExprSingle)*)? ")"
class XQuery::Core::FunctionCall is XQuery::Core::Node {
    has $.name;
    has @.args;
};

#[64]    	Constructor 	   ::=    	ComputedConstructor
#[65]    	ComputedConstructor 	   ::=    	CompDocConstructor
#| CompElemConstructor
#| CompAttrConstructor
#| CompTextConstructor
#| CompCommentConstructor
#| CompPIConstructor
#[66]    	CompDocConstructor 	   ::=    	"document" "{" Expr "}"
#[67]    	CompElemConstructor 	   ::=    	"element" (QName | ("{" Expr "}")) "{" ContentExpr "}" "{" NamespaceBinding* "}"
#[68]    	NamespaceBinding 	   ::=    	"namespace" NCName "{" URILiteral "}"
#[69]    	ContentExpr 	   ::=    	Expr
#[70]    	CompAttrConstructor 	   ::=    	"attribute" (QName | ("{" Expr "}")) "{" Expr "}"
#[71]    	CompTextConstructor 	   ::=    	"text" "{" Expr "}"
#[72]    	CompCommentConstructor 	   ::=    	"comment" "{" Expr "}"
#[73]    	CompPIConstructor 	   ::=    	"processing-instruction" (NCName | ("{" Expr "}")) "{" Expr? "}"
#[74]    	SingleType 	   ::=    	AtomicType "?"?
#[75]    	TypeDeclaration 	   ::=    	"as" SequenceType
#[76]    	SequenceType 	   ::=    	("empty-sequence" "(" ")")
#| (ItemType OccurrenceIndicator?)
#[77]    	OccurrenceIndicator 	   ::=    	"?" | "*" | "+"
#[78]    	ItemType 	   ::=    	KindTest | ("item" "(" ")") | AtomicType
#[79]    	AtomicType 	   ::=    	QName
#[80]    	KindTest 	   ::=    	DocumentTest
#| ElementTest
#| AttributeTest
#| SchemaElementTest
#| SchemaAttributeTest
#| PITest
#| CommentTest
#| TextTest
#| AnyKindTest
#[81]    	AnyKindTest 	   ::=    	"node" "(" ")"
#[82]    	DocumentTest 	   ::=    	"document-node" "(" (ElementTest | SchemaElementTest)? ")"
#[83]    	TextTest 	   ::=    	"text" "(" ")"
#[84]    	CommentTest 	   ::=    	"comment" "(" ")"
#[85]    	PITest 	   ::=    	"processing-instruction" "(" (NCName | StringLiteral)? ")"
#[86]    	AttributeTest 	   ::=    	"attribute" "(" (AttribNameOrWildcard ("," TypeName)?)? ")"
#[87]    	AttribNameOrWildcard 	   ::=    	AttributeName | "*"
#[88]    	SchemaAttributeTest 	   ::=    	"schema-attribute" "(" AttributeDeclaration ")"
#[89]    	AttributeDeclaration 	   ::=    	AttributeName
#[90]    	ElementTest 	   ::=    	"element" "(" (ElementNameOrWildcard ("," TypeName "?"?)?)? ")"
#[91]    	ElementNameOrWildcard 	   ::=    	ElementName | "*"
#[92]    	SchemaElementTest 	   ::=    	"schema-element" "(" ElementDeclaration ")"
#[93]    	ElementDeclaration 	   ::=    	ElementName
#[94]    	AttributeName 	   ::=    	QName
#[95]    	ElementName 	   ::=    	QName
#[96]    	TypeName 	   ::=    	QName
#[97]    	URILiteral 	   ::=    	StringLiteral

# vim: ft=perl6
