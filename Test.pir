
.namespace []
.sub "_block64"  :anon :subid("33")
    .const 'Sub' $P1514 = "proclaim" 
    capture_lex $P1514
    .const 'Sub' $P1475 = "eval_exception" 
    capture_lex $P1475
    .const 'Sub' $P1252 = "_is_deeply" 
    capture_lex $P1252
    .const 'Sub' $P1211 = "is_deeply" 
    capture_lex $P1211
    .const 'Sub' $P1160 = "is_deeply" 
    capture_lex $P1160
    .const 'Sub' $P1137 = "eval_lives_ok" 
    capture_lex $P1137
    .const 'Sub' $P1101 = "eval_lives_ok" 
    capture_lex $P1101
    .const 'Sub' $P1078 = "eval_dies_ok" 
    capture_lex $P1078
    .const 'Sub' $P1043 = "eval_dies_ok" 
    capture_lex $P1043
    .const 'Sub' $P1020 = "lives_ok" 
    capture_lex $P1020
    .const 'Sub' $P974 = "lives_ok" 
    capture_lex $P974
    .const 'Sub' $P951 = "dies_ok" 
    capture_lex $P951
    .const 'Sub' $P906 = "dies_ok" 
    capture_lex $P906
    .const 'Sub' $P861 = "isa_ok" 
    capture_lex $P861
    .const 'Sub' $P821 = "isa_ok" 
    capture_lex $P821
    .const 'Sub' $P795 = "flunk" 
    capture_lex $P795
    .const 'Sub' $P771 = "diag" 
    capture_lex $P771
    .const 'Sub' $P746 = "skip_rest" 
    capture_lex $P746
    .const 'Sub' $P731 = "skip_rest" 
    capture_lex $P731
    .const 'Sub' $P680 = "skip" 
    capture_lex $P680
    .const 'Sub' $P655 = "skip" 
    capture_lex $P655
    .const 'Sub' $P642 = "skip" 
    capture_lex $P642
    .const 'Sub' $P613 = "todo" 
    capture_lex $P613
    .const 'Sub' $P574 = "todo" 
    capture_lex $P574
    .const 'Sub' $P540 = "is_approx" 
    capture_lex $P540
    .const 'Sub' $P484 = "is_approx" 
    capture_lex $P484
    .const 'Sub' $P444 = "isnt" 
    capture_lex $P444
    .const 'Sub' $P390 = "isnt" 
    capture_lex $P390
    .const 'Sub' $P350 = "is" 
    capture_lex $P350
    .const 'Sub' $P297 = "is" 
    capture_lex $P297
    .const 'Sub' $P270 = "nok" 
    capture_lex $P270
    .const 'Sub' $P233 = "nok" 
    capture_lex $P233
    .const 'Sub' $P207 = "ok" 
    capture_lex $P207
    .const 'Sub' $P171 = "ok" 
    capture_lex $P171
    .const 'Sub' $P148 = "pass" 
    capture_lex $P148
    .const 'Sub' $P120 = "plan" 
    capture_lex $P120
    .const 'Sub' $P80 = "approx" 
    capture_lex $P80
    get_namespace $P66
    .lex "$?PACKAGE", $P66
.include "interpinfo.pasm"
    new $P67, "Perl6Scalar"
    .lex "$_", $P67
    new $P68, "Perl6Scalar"
    .lex "$/", $P68
    new $P69, "Perl6Scalar"
    .lex "$!", $P69
    get_global $P70, "$num_of_tests_run"
    unless_null $P70, vivify_24
    new $P70, "Perl6Scalar"
    set_global "$num_of_tests_run", $P70
  vivify_24:
    new $P71, "Int"
    assign $P71, 0
    "infix:="($P70, $P71)
    get_global $P72, "$num_of_tests_failed"
    unless_null $P72, vivify_25
    new $P72, "Perl6Scalar"
    set_global "$num_of_tests_failed", $P72
  vivify_25:
    new $P73, "Int"
    assign $P73, 0
    "infix:="($P72, $P73)
    get_global $P74, "$num_of_tests_planned"
    unless_null $P74, vivify_26
    new $P74, "Perl6Scalar"
  vivify_26:
    get_global $P75, "$todo_upto_test_num"
    unless_null $P75, vivify_27
    new $P75, "Perl6Scalar"
    set_global "$todo_upto_test_num", $P75
  vivify_27:
    new $P76, "Int"
    assign $P76, 0
    "infix:="($P75, $P76)
    get_global $P77, "$todo_reason"
    unless_null $P77, vivify_28
    new $P77, "Perl6Scalar"
    set_global "$todo_reason", $P77
  vivify_28:
    new $P78, "Perl6Str"
    assign $P78, ""
    "infix:="($P77, $P78)
    get_global $P79, "$testing_started"
    unless_null $P79, vivify_29
    new $P79, "Perl6Scalar"
  vivify_29:
    .const 'Sub' $P1589 = "_block1588" 
    capture_lex $P1589
    .return ($P1589)
    .const 'Sub' $P1644 = "_block1643" 
    capture_lex $P1644
    .return ($P1644)
.end


.namespace []
.sub "" :load :init :subid("34") :outer("33")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
$P0 = compreg "Perl6"
unless null $P0 goto have_perl6
load_bytecode "perl6.pbc"
have_perl6:
.end


.namespace []
.sub "approx"  :subid("35") :outer("33")
    .param pmc param_83
    .param pmc param_86
    new $P82, 'ExceptionHandler'
    set_addr $P82, control_81
    $P82."handle_types"(58)
    push_eh $P82
    .lex "$x", param_83
    find_lex $P84, "$x"
    $P85 = new "Perl6Scalar", $P84
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P85, "readonly", $P0
    store_lex "$x", $P85
    .lex "$y", param_86
    find_lex $P87, "$y"
    $P88 = new "Perl6Scalar", $P87
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P88, "readonly", $P0
    store_lex "$y", $P88
    new $P89, "Perl6Scalar"
    .lex "$_", $P89
    new $P90, "Perl6Scalar"
    .lex "$/", $P90
    new $P91, "Perl6Scalar"
    .lex "$!", $P91
    new $P92, "Perl6Scalar"
    .lex "$epsilon", $P92
    new $P93, "Num"
    assign $P93, 1e-05
    "infix:="($P92, $P93)
    new $P94, "Perl6Scalar"
    .lex "$diff", $P94
    find_lex $P95, "$x"
    unless_null $P95, vivify_30
    new $P95, "Perl6Scalar"
  vivify_30:
    find_lex $P96, "$y"
    unless_null $P96, vivify_31
    new $P96, "Perl6Scalar"
  vivify_31:
    $P97 = "infix:-"($P95, $P96)
    $P98 = "abs"($P97)
    "infix:="($P94, $P98)
    find_lex $P100, "$diff"
    unless_null $P100, vivify_32
    new $P100, "Perl6Scalar"
  vivify_32:
    find_lex $P101, "$epsilon"
    unless_null $P101, vivify_33
    new $P101, "Perl6Scalar"
  vivify_33:
    $P99 = "infix:<"($P100, $P101)
  chain_end_34:
    .return ($P99)
  control_81:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("36") :outer("35")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    get_global $P103, "Sub"
setprop block, "$!proto", $P103
    get_hll_global $P104, "Signature"
    $P1 = new "Hash"
    new $P105, "String"
    assign $P105, "name"
    new $P106, "String"
    assign $P106, "$x"
    $P1[$P105] = $P106
    new $P107, "String"
    assign $P107, "multi_invocant"
    new $P108, 'Integer'
    set $P108, 1
    $P1[$P107] = $P108
    new $P109, "String"
    assign $P109, "constraints"
    $P2 = new "List"
    $P110 = $P2
    $P1[$P109] = $P110
    $P111 = $P1
    $P1 = new "Hash"
    new $P112, "String"
    assign $P112, "name"
    new $P113, "String"
    assign $P113, "$y"
    $P1[$P112] = $P113
    new $P114, "String"
    assign $P114, "multi_invocant"
    new $P115, 'Integer'
    set $P115, 1
    $P1[$P114] = $P115
    new $P116, "String"
    assign $P116, "constraints"
    $P2 = new "List"
    $P117 = $P2
    $P1[$P116] = $P117
    $P118 = $P1
    $P119 = $P104."!create"($P111, $P118)
setprop block, "$!signature", $P119
.end


.namespace []
.sub "plan"  :subid("37") :outer("33")
    .param pmc param_123
    new $P122, 'ExceptionHandler'
    set_addr $P122, control_121
    $P122."handle_types"(58)
    push_eh $P122
    .lex "$number_of_tests", param_123
    find_lex $P124, "$number_of_tests"
    $P125 = new "Perl6Scalar", $P124
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P125, "readonly", $P0
    store_lex "$number_of_tests", $P125
    new $P126, "Perl6Scalar"
    .lex "$_", $P126
    new $P127, "Perl6Scalar"
    .lex "$/", $P127
    new $P128, "Perl6Scalar"
    .lex "$!", $P128
    get_global $P129, "$testing_started"
    unless_null $P129, vivify_35
    new $P129, "Perl6Scalar"
    set_global "$testing_started", $P129
  vivify_35:
    new $P130, "Int"
    assign $P130, 1
    "infix:="($P129, $P130)
    get_global $P131, "$num_of_tests_planned"
    unless_null $P131, vivify_36
    new $P131, "Perl6Scalar"
    set_global "$num_of_tests_planned", $P131
  vivify_36:
    find_lex $P132, "$number_of_tests"
    unless_null $P132, vivify_37
    new $P132, "Perl6Scalar"
  vivify_37:
    "infix:="($P131, $P132)
    new $P133, "Perl6Str"
    assign $P133, "1.."
    find_lex $P134, "$number_of_tests"
    unless_null $P134, vivify_38
    new $P134, "Perl6Scalar"
  vivify_38:
    $P135 = "infix:~"($P133, $P134)
    $P136 = "say"($P135)
    .return ($P136)
  control_121:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P137, exception, "payload"
    .return ($P137)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("38") :outer("37")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "plan", block
    get_global $P138, "Sub"
setprop block, "$!proto", $P138
    get_hll_global $P139, "Signature"
    $P1 = new "Hash"
    new $P140, "String"
    assign $P140, "name"
    new $P141, "String"
    assign $P141, "$number_of_tests"
    $P1[$P140] = $P141
    new $P142, "String"
    assign $P142, "multi_invocant"
    new $P143, 'Integer'
    set $P143, 1
    $P1[$P142] = $P143
    new $P144, "String"
    assign $P144, "constraints"
    $P2 = new "List"
    $P145 = $P2
    $P1[$P144] = $P145
    $P146 = $P1
    $P147 = $P139."!create"($P146)
setprop block, "$!signature", $P147
.end


.namespace []
.sub "pass"  :multi() :subid("39") :outer("33")
    .param pmc param_151
    new $P150, 'ExceptionHandler'
    set_addr $P150, control_149
    $P150."handle_types"(58)
    push_eh $P150
    .lex "$desc", param_151
    find_lex $P152, "$desc"
    $P153 = new "Perl6Scalar", $P152
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P153, "readonly", $P0
    store_lex "$desc", $P153
    new $P154, "Perl6Scalar"
    .lex "$_", $P154
    new $P155, "Perl6Scalar"
    .lex "$/", $P155
    new $P156, "Perl6Scalar"
    .lex "$!", $P156
    new $P157, "Int"
    assign $P157, 1
    find_lex $P158, "$desc"
    unless_null $P158, vivify_39
    new $P158, "Perl6Scalar"
  vivify_39:
    $P159 = "proclaim"($P157, $P158)
    .return ($P159)
  control_149:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P160, exception, "payload"
    .return ($P160)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("40") :outer("39")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "pass", block
    get_global $P161, "Sub"
setprop block, "$!proto", $P161
    get_hll_global $P162, "Signature"
    $P1 = new "Hash"
    new $P163, "String"
    assign $P163, "name"
    new $P164, "String"
    assign $P164, "$desc"
    $P1[$P163] = $P164
    new $P165, "String"
    assign $P165, "multi_invocant"
    new $P166, 'Integer'
    set $P166, 1
    $P1[$P165] = $P166
    new $P167, "String"
    assign $P167, "constraints"
    $P2 = new "List"
    $P168 = $P2
    $P1[$P167] = $P168
    $P169 = $P1
    $P170 = $P162."!create"($P169)
setprop block, "$!signature", $P170
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "ok"  :multi() :subid("41") :outer("33")
    .param pmc param_174
    .param pmc param_177
    new $P173, 'ExceptionHandler'
    set_addr $P173, control_172
    $P173."handle_types"(58)
    push_eh $P173
    .lex "$cond", param_174
    find_lex $P175, "$cond"
    $P176 = new "Perl6Scalar", $P175
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P176, "readonly", $P0
    store_lex "$cond", $P176
    .lex "$desc", param_177
    find_lex $P178, "$desc"
    $P179 = new "Perl6Scalar", $P178
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P179, "readonly", $P0
    store_lex "$desc", $P179
    get_hll_global $P180, "Object"
    unless_null $P180, vivify_41
    new $P180, "Failure"
  vivify_41:
    find_lex $P181, "$cond"
    "!TYPECHECKPARAM"($P180, $P181)
    new $P182, "Perl6Scalar"
    .lex "$_", $P182
    new $P183, "Perl6Scalar"
    .lex "$/", $P183
    new $P184, "Perl6Scalar"
    .lex "$!", $P184
    find_lex $P185, "$cond"
    unless_null $P185, vivify_42
    new $P185, "Perl6Scalar"
  vivify_42:
    find_lex $P186, "$desc"
    unless_null $P186, vivify_43
    new $P186, "Perl6Scalar"
  vivify_43:
    $P187 = "proclaim"($P185, $P186)
    .return ($P187)
  control_172:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P188, exception, "payload"
    .return ($P188)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("42") :outer("41")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "ok", block
    get_global $P189, "Sub"
setprop block, "$!proto", $P189
    get_hll_global $P190, "Signature"
    $P1 = new "Hash"
    new $P191, "String"
    assign $P191, "name"
    new $P192, "String"
    assign $P192, "$cond"
    $P1[$P191] = $P192
    new $P193, "String"
    assign $P193, "multi_invocant"
    new $P194, 'Integer'
    set $P194, 1
    $P1[$P193] = $P194
    new $P195, "String"
    assign $P195, "constraints"
    $P2 = new "List"
    get_hll_global $P196, "Object"
    unless_null $P196, vivify_40
    new $P196, "Failure"
  vivify_40:
    push $P2, $P196
    $P197 = $P2
    $P1[$P195] = $P197
    $P198 = $P1
    $P1 = new "Hash"
    new $P199, "String"
    assign $P199, "name"
    new $P200, "String"
    assign $P200, "$desc"
    $P1[$P199] = $P200
    new $P201, "String"
    assign $P201, "multi_invocant"
    new $P202, 'Integer'
    set $P202, 1
    $P1[$P201] = $P202
    new $P203, "String"
    assign $P203, "constraints"
    $P2 = new "List"
    $P204 = $P2
    $P1[$P203] = $P204
    $P205 = $P1
    $P206 = $P190."!create"($P198, $P205)
setprop block, "$!signature", $P206
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "ok"  :multi() :subid("43") :outer("33")
    .param pmc param_210
    new $P209, 'ExceptionHandler'
    set_addr $P209, control_208
    $P209."handle_types"(58)
    push_eh $P209
    .lex "$cond", param_210
    find_lex $P211, "$cond"
    $P212 = new "Perl6Scalar", $P211
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P212, "readonly", $P0
    store_lex "$cond", $P212
    get_hll_global $P213, "Object"
    unless_null $P213, vivify_45
    new $P213, "Failure"
  vivify_45:
    find_lex $P214, "$cond"
    "!TYPECHECKPARAM"($P213, $P214)
    new $P215, "Perl6Scalar"
    .lex "$_", $P215
    new $P216, "Perl6Scalar"
    .lex "$/", $P216
    new $P217, "Perl6Scalar"
    .lex "$!", $P217
    find_lex $P218, "$cond"
    unless_null $P218, vivify_46
    new $P218, "Perl6Scalar"
  vivify_46:
    new $P219, "Perl6Str"
    assign $P219, ""
    $P220 = "ok"($P218, $P219)
    .return ($P220)
  control_208:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P221, exception, "payload"
    .return ($P221)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("44") :outer("43")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "ok", block
    get_global $P222, "Sub"
setprop block, "$!proto", $P222
    get_hll_global $P223, "Signature"
    $P1 = new "Hash"
    new $P224, "String"
    assign $P224, "name"
    new $P225, "String"
    assign $P225, "$cond"
    $P1[$P224] = $P225
    new $P226, "String"
    assign $P226, "multi_invocant"
    new $P227, 'Integer'
    set $P227, 1
    $P1[$P226] = $P227
    new $P228, "String"
    assign $P228, "constraints"
    $P2 = new "List"
    get_hll_global $P229, "Object"
    unless_null $P229, vivify_44
    new $P229, "Failure"
  vivify_44:
    push $P2, $P229
    $P230 = $P2
    $P1[$P228] = $P230
    $P231 = $P1
    $P232 = $P223."!create"($P231)
setprop block, "$!signature", $P232
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "nok"  :multi() :subid("45") :outer("33")
    .param pmc param_236
    .param pmc param_239
    new $P235, 'ExceptionHandler'
    set_addr $P235, control_234
    $P235."handle_types"(58)
    push_eh $P235
    .lex "$cond", param_236
    find_lex $P237, "$cond"
    $P238 = new "Perl6Scalar", $P237
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P238, "readonly", $P0
    store_lex "$cond", $P238
    .lex "$desc", param_239
    find_lex $P240, "$desc"
    $P241 = new "Perl6Scalar", $P240
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P241, "readonly", $P0
    store_lex "$desc", $P241
    get_hll_global $P242, "Object"
    unless_null $P242, vivify_48
    new $P242, "Failure"
  vivify_48:
    find_lex $P243, "$cond"
    "!TYPECHECKPARAM"($P242, $P243)
    new $P244, "Perl6Scalar"
    .lex "$_", $P244
    new $P245, "Perl6Scalar"
    .lex "$/", $P245
    new $P246, "Perl6Scalar"
    .lex "$!", $P246
    find_lex $P247, "$cond"
    unless_null $P247, vivify_49
    new $P247, "Perl6Scalar"
  vivify_49:
    $P248 = "prefix:!"($P247)
    find_lex $P249, "$desc"
    unless_null $P249, vivify_50
    new $P249, "Perl6Scalar"
  vivify_50:
    $P250 = "proclaim"($P248, $P249)
    .return ($P250)
  control_234:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P251, exception, "payload"
    .return ($P251)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("46") :outer("45")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "nok", block
    get_global $P252, "Sub"
setprop block, "$!proto", $P252
    get_hll_global $P253, "Signature"
    $P1 = new "Hash"
    new $P254, "String"
    assign $P254, "name"
    new $P255, "String"
    assign $P255, "$cond"
    $P1[$P254] = $P255
    new $P256, "String"
    assign $P256, "multi_invocant"
    new $P257, 'Integer'
    set $P257, 1
    $P1[$P256] = $P257
    new $P258, "String"
    assign $P258, "constraints"
    $P2 = new "List"
    get_hll_global $P259, "Object"
    unless_null $P259, vivify_47
    new $P259, "Failure"
  vivify_47:
    push $P2, $P259
    $P260 = $P2
    $P1[$P258] = $P260
    $P261 = $P1
    $P1 = new "Hash"
    new $P262, "String"
    assign $P262, "name"
    new $P263, "String"
    assign $P263, "$desc"
    $P1[$P262] = $P263
    new $P264, "String"
    assign $P264, "multi_invocant"
    new $P265, 'Integer'
    set $P265, 1
    $P1[$P264] = $P265
    new $P266, "String"
    assign $P266, "constraints"
    $P2 = new "List"
    $P267 = $P2
    $P1[$P266] = $P267
    $P268 = $P1
    $P269 = $P253."!create"($P261, $P268)
setprop block, "$!signature", $P269
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "nok"  :multi() :subid("47") :outer("33")
    .param pmc param_273
    new $P272, 'ExceptionHandler'
    set_addr $P272, control_271
    $P272."handle_types"(58)
    push_eh $P272
    .lex "$cond", param_273
    find_lex $P274, "$cond"
    $P275 = new "Perl6Scalar", $P274
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P275, "readonly", $P0
    store_lex "$cond", $P275
    get_hll_global $P276, "Object"
    unless_null $P276, vivify_52
    new $P276, "Failure"
  vivify_52:
    find_lex $P277, "$cond"
    "!TYPECHECKPARAM"($P276, $P277)
    new $P278, "Perl6Scalar"
    .lex "$_", $P278
    new $P279, "Perl6Scalar"
    .lex "$/", $P279
    new $P280, "Perl6Scalar"
    .lex "$!", $P280
    find_lex $P281, "$cond"
    unless_null $P281, vivify_53
    new $P281, "Perl6Scalar"
  vivify_53:
    $P282 = "prefix:!"($P281)
    new $P283, "Perl6Str"
    assign $P283, ""
    $P284 = "nok"($P282, $P283)
    .return ($P284)
  control_271:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P285, exception, "payload"
    .return ($P285)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("48") :outer("47")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "nok", block
    get_global $P286, "Sub"
setprop block, "$!proto", $P286
    get_hll_global $P287, "Signature"
    $P1 = new "Hash"
    new $P288, "String"
    assign $P288, "name"
    new $P289, "String"
    assign $P289, "$cond"
    $P1[$P288] = $P289
    new $P290, "String"
    assign $P290, "multi_invocant"
    new $P291, 'Integer'
    set $P291, 1
    $P1[$P290] = $P291
    new $P292, "String"
    assign $P292, "constraints"
    $P2 = new "List"
    get_hll_global $P293, "Object"
    unless_null $P293, vivify_51
    new $P293, "Failure"
  vivify_51:
    push $P2, $P293
    $P294 = $P2
    $P1[$P292] = $P294
    $P295 = $P1
    $P296 = $P287."!create"($P295)
setprop block, "$!signature", $P296
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "is"  :multi() :subid("49") :outer("33")
    .param pmc param_300
    .param pmc param_303
    .param pmc param_306
    new $P299, 'ExceptionHandler'
    set_addr $P299, control_298
    $P299."handle_types"(58)
    push_eh $P299
    .lex "$got", param_300
    find_lex $P301, "$got"
    $P302 = new "Perl6Scalar", $P301
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P302, "readonly", $P0
    store_lex "$got", $P302
    .lex "$expected", param_303
    find_lex $P304, "$expected"
    $P305 = new "Perl6Scalar", $P304
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P305, "readonly", $P0
    store_lex "$expected", $P305
    .lex "$desc", param_306
    find_lex $P307, "$desc"
    $P308 = new "Perl6Scalar", $P307
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P308, "readonly", $P0
    store_lex "$desc", $P308
    get_hll_global $P309, "Object"
    unless_null $P309, vivify_56
    new $P309, "Failure"
  vivify_56:
    find_lex $P310, "$got"
    "!TYPECHECKPARAM"($P309, $P310)
    get_hll_global $P311, "Object"
    unless_null $P311, vivify_57
    new $P311, "Failure"
  vivify_57:
    find_lex $P312, "$expected"
    "!TYPECHECKPARAM"($P311, $P312)
    new $P313, "Perl6Scalar"
    .lex "$_", $P313
    new $P314, "Perl6Scalar"
    .lex "$/", $P314
    new $P315, "Perl6Scalar"
    .lex "$!", $P315
    new $P316, "Perl6Scalar"
    .lex "$test", $P316
    find_lex $P318, "$got"
    unless_null $P318, vivify_58
    new $P318, "Perl6Scalar"
  vivify_58:
    find_lex $P319, "$expected"
    unless_null $P319, vivify_59
    new $P319, "Perl6Scalar"
  vivify_59:
    $P317 = "infix:eq"($P318, $P319)
  chain_end_60:
    "infix:="($P316, $P317)
    find_lex $P320, "$test"
    unless_null $P320, vivify_61
    new $P320, "Perl6Scalar"
  vivify_61:
    find_lex $P321, "$desc"
    unless_null $P321, vivify_62
    new $P321, "Perl6Scalar"
  vivify_62:
    $P322 = "proclaim"($P320, $P321)
    .return ($P322)
  control_298:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P323, exception, "payload"
    .return ($P323)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("50") :outer("49")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "is", block
    get_global $P324, "Sub"
setprop block, "$!proto", $P324
    get_hll_global $P325, "Signature"
    $P1 = new "Hash"
    new $P326, "String"
    assign $P326, "name"
    new $P327, "String"
    assign $P327, "$got"
    $P1[$P326] = $P327
    new $P328, "String"
    assign $P328, "multi_invocant"
    new $P329, 'Integer'
    set $P329, 1
    $P1[$P328] = $P329
    new $P330, "String"
    assign $P330, "constraints"
    $P2 = new "List"
    get_hll_global $P331, "Object"
    unless_null $P331, vivify_54
    new $P331, "Failure"
  vivify_54:
    push $P2, $P331
    $P332 = $P2
    $P1[$P330] = $P332
    $P333 = $P1
    $P1 = new "Hash"
    new $P334, "String"
    assign $P334, "name"
    new $P335, "String"
    assign $P335, "$expected"
    $P1[$P334] = $P335
    new $P336, "String"
    assign $P336, "multi_invocant"
    new $P337, 'Integer'
    set $P337, 1
    $P1[$P336] = $P337
    new $P338, "String"
    assign $P338, "constraints"
    $P2 = new "List"
    get_hll_global $P339, "Object"
    unless_null $P339, vivify_55
    new $P339, "Failure"
  vivify_55:
    push $P2, $P339
    $P340 = $P2
    $P1[$P338] = $P340
    $P341 = $P1
    $P1 = new "Hash"
    new $P342, "String"
    assign $P342, "name"
    new $P343, "String"
    assign $P343, "$desc"
    $P1[$P342] = $P343
    new $P344, "String"
    assign $P344, "multi_invocant"
    new $P345, 'Integer'
    set $P345, 1
    $P1[$P344] = $P345
    new $P346, "String"
    assign $P346, "constraints"
    $P2 = new "List"
    $P347 = $P2
    $P1[$P346] = $P347
    $P348 = $P1
    $P349 = $P325."!create"($P333, $P341, $P348)
setprop block, "$!signature", $P349
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "is"  :multi() :subid("51") :outer("33")
    .param pmc param_353
    .param pmc param_356
    new $P352, 'ExceptionHandler'
    set_addr $P352, control_351
    $P352."handle_types"(58)
    push_eh $P352
    .lex "$got", param_353
    find_lex $P354, "$got"
    $P355 = new "Perl6Scalar", $P354
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P355, "readonly", $P0
    store_lex "$got", $P355
    .lex "$expected", param_356
    find_lex $P357, "$expected"
    $P358 = new "Perl6Scalar", $P357
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P358, "readonly", $P0
    store_lex "$expected", $P358
    get_hll_global $P359, "Object"
    unless_null $P359, vivify_65
    new $P359, "Failure"
  vivify_65:
    find_lex $P360, "$got"
    "!TYPECHECKPARAM"($P359, $P360)
    get_hll_global $P361, "Object"
    unless_null $P361, vivify_66
    new $P361, "Failure"
  vivify_66:
    find_lex $P362, "$expected"
    "!TYPECHECKPARAM"($P361, $P362)
    new $P363, "Perl6Scalar"
    .lex "$_", $P363
    new $P364, "Perl6Scalar"
    .lex "$/", $P364
    new $P365, "Perl6Scalar"
    .lex "$!", $P365
    find_lex $P366, "$got"
    unless_null $P366, vivify_67
    new $P366, "Perl6Scalar"
  vivify_67:
    find_lex $P367, "$expected"
    unless_null $P367, vivify_68
    new $P367, "Perl6Scalar"
  vivify_68:
    new $P368, "Perl6Str"
    assign $P368, ""
    $P369 = "is"($P366, $P367, $P368)
    .return ($P369)
  control_351:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P370, exception, "payload"
    .return ($P370)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("52") :outer("51")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "is", block
    get_global $P371, "Sub"
setprop block, "$!proto", $P371
    get_hll_global $P372, "Signature"
    $P1 = new "Hash"
    new $P373, "String"
    assign $P373, "name"
    new $P374, "String"
    assign $P374, "$got"
    $P1[$P373] = $P374
    new $P375, "String"
    assign $P375, "multi_invocant"
    new $P376, 'Integer'
    set $P376, 1
    $P1[$P375] = $P376
    new $P377, "String"
    assign $P377, "constraints"
    $P2 = new "List"
    get_hll_global $P378, "Object"
    unless_null $P378, vivify_63
    new $P378, "Failure"
  vivify_63:
    push $P2, $P378
    $P379 = $P2
    $P1[$P377] = $P379
    $P380 = $P1
    $P1 = new "Hash"
    new $P381, "String"
    assign $P381, "name"
    new $P382, "String"
    assign $P382, "$expected"
    $P1[$P381] = $P382
    new $P383, "String"
    assign $P383, "multi_invocant"
    new $P384, 'Integer'
    set $P384, 1
    $P1[$P383] = $P384
    new $P385, "String"
    assign $P385, "constraints"
    $P2 = new "List"
    get_hll_global $P386, "Object"
    unless_null $P386, vivify_64
    new $P386, "Failure"
  vivify_64:
    push $P2, $P386
    $P387 = $P2
    $P1[$P385] = $P387
    $P388 = $P1
    $P389 = $P372."!create"($P380, $P388)
setprop block, "$!signature", $P389
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "isnt"  :multi() :subid("53") :outer("33")
    .param pmc param_393
    .param pmc param_396
    .param pmc param_399
    new $P392, 'ExceptionHandler'
    set_addr $P392, control_391
    $P392."handle_types"(58)
    push_eh $P392
    .lex "$got", param_393
    find_lex $P394, "$got"
    $P395 = new "Perl6Scalar", $P394
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P395, "readonly", $P0
    store_lex "$got", $P395
    .lex "$expected", param_396
    find_lex $P397, "$expected"
    $P398 = new "Perl6Scalar", $P397
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P398, "readonly", $P0
    store_lex "$expected", $P398
    .lex "$desc", param_399
    find_lex $P400, "$desc"
    $P401 = new "Perl6Scalar", $P400
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P401, "readonly", $P0
    store_lex "$desc", $P401
    get_hll_global $P402, "Object"
    unless_null $P402, vivify_71
    new $P402, "Failure"
  vivify_71:
    find_lex $P403, "$got"
    "!TYPECHECKPARAM"($P402, $P403)
    get_hll_global $P404, "Object"
    unless_null $P404, vivify_72
    new $P404, "Failure"
  vivify_72:
    find_lex $P405, "$expected"
    "!TYPECHECKPARAM"($P404, $P405)
    new $P406, "Perl6Scalar"
    .lex "$_", $P406
    new $P407, "Perl6Scalar"
    .lex "$/", $P407
    new $P408, "Perl6Scalar"
    .lex "$!", $P408
    new $P409, "Perl6Scalar"
    .lex "$test", $P409
    find_lex $P411, "$got"
    unless_null $P411, vivify_73
    new $P411, "Perl6Scalar"
  vivify_73:
    find_lex $P412, "$expected"
    unless_null $P412, vivify_74
    new $P412, "Perl6Scalar"
  vivify_74:
    $P410 = "infix:eq"($P411, $P412)
  chain_end_75:
    $P413 = "prefix:!"($P410)
    "infix:="($P409, $P413)
    find_lex $P414, "$test"
    unless_null $P414, vivify_76
    new $P414, "Perl6Scalar"
  vivify_76:
    find_lex $P415, "$desc"
    unless_null $P415, vivify_77
    new $P415, "Perl6Scalar"
  vivify_77:
    $P416 = "proclaim"($P414, $P415)
    .return ($P416)
  control_391:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P417, exception, "payload"
    .return ($P417)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("54") :outer("53")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "isnt", block
    get_global $P418, "Sub"
setprop block, "$!proto", $P418
    get_hll_global $P419, "Signature"
    $P1 = new "Hash"
    new $P420, "String"
    assign $P420, "name"
    new $P421, "String"
    assign $P421, "$got"
    $P1[$P420] = $P421
    new $P422, "String"
    assign $P422, "multi_invocant"
    new $P423, 'Integer'
    set $P423, 1
    $P1[$P422] = $P423
    new $P424, "String"
    assign $P424, "constraints"
    $P2 = new "List"
    get_hll_global $P425, "Object"
    unless_null $P425, vivify_69
    new $P425, "Failure"
  vivify_69:
    push $P2, $P425
    $P426 = $P2
    $P1[$P424] = $P426
    $P427 = $P1
    $P1 = new "Hash"
    new $P428, "String"
    assign $P428, "name"
    new $P429, "String"
    assign $P429, "$expected"
    $P1[$P428] = $P429
    new $P430, "String"
    assign $P430, "multi_invocant"
    new $P431, 'Integer'
    set $P431, 1
    $P1[$P430] = $P431
    new $P432, "String"
    assign $P432, "constraints"
    $P2 = new "List"
    get_hll_global $P433, "Object"
    unless_null $P433, vivify_70
    new $P433, "Failure"
  vivify_70:
    push $P2, $P433
    $P434 = $P2
    $P1[$P432] = $P434
    $P435 = $P1
    $P1 = new "Hash"
    new $P436, "String"
    assign $P436, "name"
    new $P437, "String"
    assign $P437, "$desc"
    $P1[$P436] = $P437
    new $P438, "String"
    assign $P438, "multi_invocant"
    new $P439, 'Integer'
    set $P439, 1
    $P1[$P438] = $P439
    new $P440, "String"
    assign $P440, "constraints"
    $P2 = new "List"
    $P441 = $P2
    $P1[$P440] = $P441
    $P442 = $P1
    $P443 = $P419."!create"($P427, $P435, $P442)
setprop block, "$!signature", $P443
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "isnt"  :multi() :subid("55") :outer("33")
    .param pmc param_447
    .param pmc param_450
    new $P446, 'ExceptionHandler'
    set_addr $P446, control_445
    $P446."handle_types"(58)
    push_eh $P446
    .lex "$got", param_447
    find_lex $P448, "$got"
    $P449 = new "Perl6Scalar", $P448
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P449, "readonly", $P0
    store_lex "$got", $P449
    .lex "$expected", param_450
    find_lex $P451, "$expected"
    $P452 = new "Perl6Scalar", $P451
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P452, "readonly", $P0
    store_lex "$expected", $P452
    get_hll_global $P453, "Object"
    unless_null $P453, vivify_80
    new $P453, "Failure"
  vivify_80:
    find_lex $P454, "$got"
    "!TYPECHECKPARAM"($P453, $P454)
    get_hll_global $P455, "Object"
    unless_null $P455, vivify_81
    new $P455, "Failure"
  vivify_81:
    find_lex $P456, "$expected"
    "!TYPECHECKPARAM"($P455, $P456)
    new $P457, "Perl6Scalar"
    .lex "$_", $P457
    new $P458, "Perl6Scalar"
    .lex "$/", $P458
    new $P459, "Perl6Scalar"
    .lex "$!", $P459
    find_lex $P460, "$got"
    unless_null $P460, vivify_82
    new $P460, "Perl6Scalar"
  vivify_82:
    find_lex $P461, "$expected"
    unless_null $P461, vivify_83
    new $P461, "Perl6Scalar"
  vivify_83:
    new $P462, "Perl6Str"
    assign $P462, ""
    $P463 = "isnt"($P460, $P461, $P462)
    .return ($P463)
  control_445:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P464, exception, "payload"
    .return ($P464)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("56") :outer("55")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "isnt", block
    get_global $P465, "Sub"
setprop block, "$!proto", $P465
    get_hll_global $P466, "Signature"
    $P1 = new "Hash"
    new $P467, "String"
    assign $P467, "name"
    new $P468, "String"
    assign $P468, "$got"
    $P1[$P467] = $P468
    new $P469, "String"
    assign $P469, "multi_invocant"
    new $P470, 'Integer'
    set $P470, 1
    $P1[$P469] = $P470
    new $P471, "String"
    assign $P471, "constraints"
    $P2 = new "List"
    get_hll_global $P472, "Object"
    unless_null $P472, vivify_78
    new $P472, "Failure"
  vivify_78:
    push $P2, $P472
    $P473 = $P2
    $P1[$P471] = $P473
    $P474 = $P1
    $P1 = new "Hash"
    new $P475, "String"
    assign $P475, "name"
    new $P476, "String"
    assign $P476, "$expected"
    $P1[$P475] = $P476
    new $P477, "String"
    assign $P477, "multi_invocant"
    new $P478, 'Integer'
    set $P478, 1
    $P1[$P477] = $P478
    new $P479, "String"
    assign $P479, "constraints"
    $P2 = new "List"
    get_hll_global $P480, "Object"
    unless_null $P480, vivify_79
    new $P480, "Failure"
  vivify_79:
    push $P2, $P480
    $P481 = $P2
    $P1[$P479] = $P481
    $P482 = $P1
    $P483 = $P466."!create"($P474, $P482)
setprop block, "$!signature", $P483
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "is_approx"  :multi() :subid("57") :outer("33")
    .param pmc param_487
    .param pmc param_490
    .param pmc param_493
    new $P486, 'ExceptionHandler'
    set_addr $P486, control_485
    $P486."handle_types"(58)
    push_eh $P486
    .lex "$got", param_487
    find_lex $P488, "$got"
    $P489 = new "Perl6Scalar", $P488
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P489, "readonly", $P0
    store_lex "$got", $P489
    .lex "$expected", param_490
    find_lex $P491, "$expected"
    $P492 = new "Perl6Scalar", $P491
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P492, "readonly", $P0
    store_lex "$expected", $P492
    .lex "$desc", param_493
    find_lex $P494, "$desc"
    $P495 = new "Perl6Scalar", $P494
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P495, "readonly", $P0
    store_lex "$desc", $P495
    get_hll_global $P496, "Object"
    unless_null $P496, vivify_86
    new $P496, "Failure"
  vivify_86:
    find_lex $P497, "$got"
    "!TYPECHECKPARAM"($P496, $P497)
    get_hll_global $P498, "Object"
    unless_null $P498, vivify_87
    new $P498, "Failure"
  vivify_87:
    find_lex $P499, "$expected"
    "!TYPECHECKPARAM"($P498, $P499)
    new $P500, "Perl6Scalar"
    .lex "$_", $P500
    new $P501, "Perl6Scalar"
    .lex "$/", $P501
    new $P502, "Perl6Scalar"
    .lex "$!", $P502
    new $P503, "Perl6Scalar"
    .lex "$test", $P503
    find_lex $P505, "$got"
    unless_null $P505, vivify_88
    new $P505, "Perl6Scalar"
  vivify_88:
    find_lex $P506, "$expected"
    unless_null $P506, vivify_89
    new $P506, "Perl6Scalar"
  vivify_89:
    $P507 = "infix:-"($P505, $P506)
    $P508 = "abs"($P507)
    new $P509, "Num"
    assign $P509, 1e-05
    $P504 = "infix:<="($P508, $P509)
  chain_end_90:
    "infix:="($P503, $P504)
    find_lex $P510, "$test"
    unless_null $P510, vivify_91
    new $P510, "Perl6Scalar"
  vivify_91:
    find_lex $P511, "$desc"
    unless_null $P511, vivify_92
    new $P511, "Perl6Scalar"
  vivify_92:
    $P512 = "proclaim"($P510, $P511)
    .return ($P512)
  control_485:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P513, exception, "payload"
    .return ($P513)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("58") :outer("57")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "is_approx", block
    get_global $P514, "Sub"
setprop block, "$!proto", $P514
    get_hll_global $P515, "Signature"
    $P1 = new "Hash"
    new $P516, "String"
    assign $P516, "name"
    new $P517, "String"
    assign $P517, "$got"
    $P1[$P516] = $P517
    new $P518, "String"
    assign $P518, "multi_invocant"
    new $P519, 'Integer'
    set $P519, 1
    $P1[$P518] = $P519
    new $P520, "String"
    assign $P520, "constraints"
    $P2 = new "List"
    get_hll_global $P521, "Object"
    unless_null $P521, vivify_84
    new $P521, "Failure"
  vivify_84:
    push $P2, $P521
    $P522 = $P2
    $P1[$P520] = $P522
    $P523 = $P1
    $P1 = new "Hash"
    new $P524, "String"
    assign $P524, "name"
    new $P525, "String"
    assign $P525, "$expected"
    $P1[$P524] = $P525
    new $P526, "String"
    assign $P526, "multi_invocant"
    new $P527, 'Integer'
    set $P527, 1
    $P1[$P526] = $P527
    new $P528, "String"
    assign $P528, "constraints"
    $P2 = new "List"
    get_hll_global $P529, "Object"
    unless_null $P529, vivify_85
    new $P529, "Failure"
  vivify_85:
    push $P2, $P529
    $P530 = $P2
    $P1[$P528] = $P530
    $P531 = $P1
    $P1 = new "Hash"
    new $P532, "String"
    assign $P532, "name"
    new $P533, "String"
    assign $P533, "$desc"
    $P1[$P532] = $P533
    new $P534, "String"
    assign $P534, "multi_invocant"
    new $P535, 'Integer'
    set $P535, 1
    $P1[$P534] = $P535
    new $P536, "String"
    assign $P536, "constraints"
    $P2 = new "List"
    $P537 = $P2
    $P1[$P536] = $P537
    $P538 = $P1
    $P539 = $P515."!create"($P523, $P531, $P538)
setprop block, "$!signature", $P539
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "is_approx"  :multi() :subid("59") :outer("33")
    .param pmc param_543
    .param pmc param_546
    new $P542, 'ExceptionHandler'
    set_addr $P542, control_541
    $P542."handle_types"(58)
    push_eh $P542
    .lex "$got", param_543
    find_lex $P544, "$got"
    $P545 = new "Perl6Scalar", $P544
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P545, "readonly", $P0
    store_lex "$got", $P545
    .lex "$expected", param_546
    find_lex $P547, "$expected"
    $P548 = new "Perl6Scalar", $P547
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P548, "readonly", $P0
    store_lex "$expected", $P548
    new $P549, "Perl6Scalar"
    .lex "$_", $P549
    new $P550, "Perl6Scalar"
    .lex "$/", $P550
    new $P551, "Perl6Scalar"
    .lex "$!", $P551
    find_lex $P552, "$got"
    unless_null $P552, vivify_93
    new $P552, "Perl6Scalar"
  vivify_93:
    find_lex $P553, "$expected"
    unless_null $P553, vivify_94
    new $P553, "Perl6Scalar"
  vivify_94:
    new $P554, "Perl6Str"
    assign $P554, ""
    $P555 = "is_approx"($P552, $P553, $P554)
    .return ($P555)
  control_541:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P556, exception, "payload"
    .return ($P556)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("60") :outer("59")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "is_approx", block
    get_global $P557, "Sub"
setprop block, "$!proto", $P557
    get_hll_global $P558, "Signature"
    $P1 = new "Hash"
    new $P559, "String"
    assign $P559, "name"
    new $P560, "String"
    assign $P560, "$got"
    $P1[$P559] = $P560
    new $P561, "String"
    assign $P561, "multi_invocant"
    new $P562, 'Integer'
    set $P562, 1
    $P1[$P561] = $P562
    new $P563, "String"
    assign $P563, "constraints"
    $P2 = new "List"
    $P564 = $P2
    $P1[$P563] = $P564
    $P565 = $P1
    $P1 = new "Hash"
    new $P566, "String"
    assign $P566, "name"
    new $P567, "String"
    assign $P567, "$expected"
    $P1[$P566] = $P567
    new $P568, "String"
    assign $P568, "multi_invocant"
    new $P569, 'Integer'
    set $P569, 1
    $P1[$P568] = $P569
    new $P570, "String"
    assign $P570, "constraints"
    $P2 = new "List"
    $P571 = $P2
    $P1[$P570] = $P571
    $P572 = $P1
    $P573 = $P558."!create"($P565, $P572)
setprop block, "$!signature", $P573
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "todo"  :multi() :subid("61") :outer("33")
    .param pmc param_577
    .param pmc param_580
    new $P576, 'ExceptionHandler'
    set_addr $P576, control_575
    $P576."handle_types"(58)
    push_eh $P576
    .lex "$reason", param_577
    find_lex $P578, "$reason"
    $P579 = new "Perl6Scalar", $P578
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P579, "readonly", $P0
    store_lex "$reason", $P579
    .lex "$count", param_580
    find_lex $P581, "$count"
    $P582 = new "Perl6Scalar", $P581
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P582, "readonly", $P0
    store_lex "$count", $P582
    new $P583, "Perl6Scalar"
    .lex "$_", $P583
    new $P584, "Perl6Scalar"
    .lex "$/", $P584
    new $P585, "Perl6Scalar"
    .lex "$!", $P585
    get_global $P586, "$todo_upto_test_num"
    unless_null $P586, vivify_95
    new $P586, "Perl6Scalar"
    set_global "$todo_upto_test_num", $P586
  vivify_95:
    get_global $P587, "$num_of_tests_run"
    unless_null $P587, vivify_96
    new $P587, "Perl6Scalar"
  vivify_96:
    find_lex $P588, "$count"
    unless_null $P588, vivify_97
    new $P588, "Perl6Scalar"
  vivify_97:
    $P589 = "infix:+"($P587, $P588)
    "infix:="($P586, $P589)
    get_global $P590, "$todo_reason"
    unless_null $P590, vivify_98
    new $P590, "Perl6Scalar"
    set_global "$todo_reason", $P590
  vivify_98:
    new $P591, "Perl6Str"
    assign $P591, "# TODO "
    find_lex $P592, "$reason"
    unless_null $P592, vivify_99
    new $P592, "Perl6Scalar"
  vivify_99:
    $P593 = "infix:~"($P591, $P592)
    $P594 = "infix:="($P590, $P593)
    .return ($P594)
  control_575:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P595, exception, "payload"
    .return ($P595)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("62") :outer("61")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "todo", block
    get_global $P596, "Sub"
setprop block, "$!proto", $P596
    get_hll_global $P597, "Signature"
    $P1 = new "Hash"
    new $P598, "String"
    assign $P598, "name"
    new $P599, "String"
    assign $P599, "$reason"
    $P1[$P598] = $P599
    new $P600, "String"
    assign $P600, "multi_invocant"
    new $P601, 'Integer'
    set $P601, 1
    $P1[$P600] = $P601
    new $P602, "String"
    assign $P602, "constraints"
    $P2 = new "List"
    $P603 = $P2
    $P1[$P602] = $P603
    $P604 = $P1
    $P1 = new "Hash"
    new $P605, "String"
    assign $P605, "name"
    new $P606, "String"
    assign $P606, "$count"
    $P1[$P605] = $P606
    new $P607, "String"
    assign $P607, "multi_invocant"
    new $P608, 'Integer'
    set $P608, 1
    $P1[$P607] = $P608
    new $P609, "String"
    assign $P609, "constraints"
    $P2 = new "List"
    $P610 = $P2
    $P1[$P609] = $P610
    $P611 = $P1
    $P612 = $P597."!create"($P604, $P611)
setprop block, "$!signature", $P612
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "todo"  :multi() :subid("63") :outer("33")
    .param pmc param_616
    new $P615, 'ExceptionHandler'
    set_addr $P615, control_614
    $P615."handle_types"(58)
    push_eh $P615
    .lex "$reason", param_616
    find_lex $P617, "$reason"
    $P618 = new "Perl6Scalar", $P617
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P618, "readonly", $P0
    store_lex "$reason", $P618
    new $P619, "Perl6Scalar"
    .lex "$_", $P619
    new $P620, "Perl6Scalar"
    .lex "$/", $P620
    new $P621, "Perl6Scalar"
    .lex "$!", $P621
    get_global $P622, "$todo_upto_test_num"
    unless_null $P622, vivify_100
    new $P622, "Perl6Scalar"
    set_global "$todo_upto_test_num", $P622
  vivify_100:
    get_global $P623, "$num_of_tests_run"
    unless_null $P623, vivify_101
    new $P623, "Perl6Scalar"
  vivify_101:
    new $P624, "Int"
    assign $P624, 1
    $P625 = "infix:+"($P623, $P624)
    "infix:="($P622, $P625)
    get_global $P626, "$todo_reason"
    unless_null $P626, vivify_102
    new $P626, "Perl6Scalar"
    set_global "$todo_reason", $P626
  vivify_102:
    new $P627, "Perl6Str"
    assign $P627, "# TODO "
    find_lex $P628, "$reason"
    unless_null $P628, vivify_103
    new $P628, "Perl6Scalar"
  vivify_103:
    $P629 = "infix:~"($P627, $P628)
    $P630 = "infix:="($P626, $P629)
    .return ($P630)
  control_614:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P631, exception, "payload"
    .return ($P631)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("64") :outer("63")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "todo", block
    get_global $P632, "Sub"
setprop block, "$!proto", $P632
    get_hll_global $P633, "Signature"
    $P1 = new "Hash"
    new $P634, "String"
    assign $P634, "name"
    new $P635, "String"
    assign $P635, "$reason"
    $P1[$P634] = $P635
    new $P636, "String"
    assign $P636, "multi_invocant"
    new $P637, 'Integer'
    set $P637, 1
    $P1[$P636] = $P637
    new $P638, "String"
    assign $P638, "constraints"
    $P2 = new "List"
    $P639 = $P2
    $P1[$P638] = $P639
    $P640 = $P1
    $P641 = $P633."!create"($P640)
setprop block, "$!signature", $P641
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "skip"  :multi() :subid("65") :outer("33")
    new $P644, 'ExceptionHandler'
    set_addr $P644, control_643
    $P644."handle_types"(58)
    push_eh $P644
    new $P645, "Perl6Scalar"
    .lex "$_", $P645
    new $P646, "Perl6Scalar"
    .lex "$/", $P646
    new $P647, "Perl6Scalar"
    .lex "$!", $P647
    new $P648, "Int"
    assign $P648, 1
    new $P649, "Perl6Str"
    assign $P649, "# SKIP"
    $P650 = "proclaim"($P648, $P649)
    .return ($P650)
  control_643:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P651, exception, "payload"
    .return ($P651)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("66") :outer("65")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "skip", block
    get_global $P652, "Sub"
setprop block, "$!proto", $P652
    get_hll_global $P653, "Signature"
    $P654 = $P653."!create"()
setprop block, "$!signature", $P654
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "skip"  :multi() :subid("67") :outer("33")
    .param pmc param_658
    new $P657, 'ExceptionHandler'
    set_addr $P657, control_656
    $P657."handle_types"(58)
    push_eh $P657
    .lex "$reason", param_658
    find_lex $P659, "$reason"
    $P660 = new "Perl6Scalar", $P659
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P660, "readonly", $P0
    store_lex "$reason", $P660
    new $P661, "Perl6Scalar"
    .lex "$_", $P661
    new $P662, "Perl6Scalar"
    .lex "$/", $P662
    new $P663, "Perl6Scalar"
    .lex "$!", $P663
    new $P664, "Int"
    assign $P664, 1
    new $P665, "Perl6Str"
    assign $P665, "# SKIP "
    find_lex $P666, "$reason"
    unless_null $P666, vivify_104
    new $P666, "Perl6Scalar"
  vivify_104:
    $P667 = "infix:~"($P665, $P666)
    $P668 = "proclaim"($P664, $P667)
    .return ($P668)
  control_656:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P669, exception, "payload"
    .return ($P669)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("68") :outer("67")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "skip", block
    get_global $P670, "Sub"
setprop block, "$!proto", $P670
    get_hll_global $P671, "Signature"
    $P1 = new "Hash"
    new $P672, "String"
    assign $P672, "name"
    new $P673, "String"
    assign $P673, "$reason"
    $P1[$P672] = $P673
    new $P674, "String"
    assign $P674, "multi_invocant"
    new $P675, 'Integer'
    set $P675, 1
    $P1[$P674] = $P675
    new $P676, "String"
    assign $P676, "constraints"
    $P2 = new "List"
    $P677 = $P2
    $P1[$P676] = $P677
    $P678 = $P1
    $P679 = $P671."!create"($P678)
setprop block, "$!signature", $P679
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "skip"  :multi() :subid("69") :outer("33")
    .param pmc param_683
    .param pmc param_686
    new $P682, 'ExceptionHandler'
    set_addr $P682, control_681
    $P682."handle_types"(58)
    push_eh $P682
    .lex "$count", param_683
    find_lex $P684, "$count"
    $P685 = new "Perl6Scalar", $P684
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P685, "readonly", $P0
    store_lex "$count", $P685
    .lex "$reason", param_686
    find_lex $P687, "$reason"
    $P688 = new "Perl6Scalar", $P687
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P688, "readonly", $P0
    store_lex "$reason", $P688
    new $P689, "Perl6Scalar"
    .lex "$_", $P689
    new $P690, "Perl6Scalar"
    .lex "$/", $P690
    new $P691, "Perl6Scalar"
    .lex "$!", $P691
    new $P693, "Int"
    assign $P693, 1
    find_lex $P694, "$count"
    unless_null $P694, vivify_105
    new $P694, "Perl6Scalar"
  vivify_105:
    $P695 = "infix:.."($P693, $P694)
    $P696 = "list"($P695)
    defined $I698, $P696
    unless $I698, for_692_undef_iter
    new $P699, 'ExceptionHandler'
    set_addr $P699, for_692_next
    $P699."handle_types"(64)
    push_eh $P699
    iter $P697, $P696
  for_692:
    unless $P697, for_692_end
    shift $P700, $P697
    .const 'Sub' $P702 = "_block701" 
    capture_lex $P702
    $P712 = $P702($P700)
    goto for_692
  for_692_next:
    .local pmc exception 
    .get_results (exception) 
    set $P699, 0
    goto for_692
  for_692_end:
    pop_eh 
  for_692_undef_iter:
    .return ($P697)
  control_681:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P713, exception, "payload"
    .return ($P713)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("70") :outer("69")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "skip", block
    get_global $P714, "Sub"
setprop block, "$!proto", $P714
    get_hll_global $P715, "Signature"
    $P1 = new "Hash"
    new $P716, "String"
    assign $P716, "name"
    new $P717, "String"
    assign $P717, "$count"
    $P1[$P716] = $P717
    new $P718, "String"
    assign $P718, "multi_invocant"
    new $P719, 'Integer'
    set $P719, 1
    $P1[$P718] = $P719
    new $P720, "String"
    assign $P720, "constraints"
    $P2 = new "List"
    $P721 = $P2
    $P1[$P720] = $P721
    $P722 = $P1
    $P1 = new "Hash"
    new $P723, "String"
    assign $P723, "name"
    new $P724, "String"
    assign $P724, "$reason"
    $P1[$P723] = $P724
    new $P725, "String"
    assign $P725, "multi_invocant"
    new $P726, 'Integer'
    set $P726, 1
    $P1[$P725] = $P726
    new $P727, "String"
    assign $P727, "constraints"
    $P2 = new "List"
    $P728 = $P2
    $P1[$P727] = $P728
    $P729 = $P1
    $P730 = $P715."!create"($P722, $P729)
setprop block, "$!signature", $P730
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "_block701"  :anon :subid("71") :outer("69")
    .param pmc param_703 :optional
    .param int has_param_703 :opt_flag
    .local pmc outerlex
    getinterp $P0
    set outerlex, $P0["outer";"lexpad";1]
    if has_param_703, optparam_106
    set $P704, outerlex["$_"]
    set param_703, $P704
  optparam_106:
    .lex "$_", param_703
    set $P705, outerlex["$/"]
    .lex "$/", $P705
    set $P706, outerlex["$!"]
    .lex "$!", $P706
    new $P707, "Int"
    assign $P707, 1
    new $P708, "Perl6Str"
    assign $P708, "# SKIP "
    find_lex $P709, "$reason"
    unless_null $P709, vivify_107
    new $P709, "Perl6Scalar"
  vivify_107:
    $P710 = "infix:~"($P708, $P709)
    $P711 = "proclaim"($P707, $P710)
    .return ($P711)
.end


.namespace []
.sub "skip_rest"  :multi() :subid("72") :outer("33")
    new $P733, 'ExceptionHandler'
    set_addr $P733, control_732
    $P733."handle_types"(58)
    push_eh $P733
    new $P734, "Perl6Scalar"
    .lex "$_", $P734
    new $P735, "Perl6Scalar"
    .lex "$/", $P735
    new $P736, "Perl6Scalar"
    .lex "$!", $P736
    get_global $P737, "$num_of_tests_planned"
    unless_null $P737, vivify_108
    new $P737, "Perl6Scalar"
  vivify_108:
    get_global $P738, "$num_of_tests_run"
    unless_null $P738, vivify_109
    new $P738, "Perl6Scalar"
  vivify_109:
    $P739 = "infix:-"($P737, $P738)
    new $P740, "Perl6Str"
    assign $P740, ""
    $P741 = "skip"($P739, $P740)
    .return ($P741)
  control_732:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P742, exception, "payload"
    .return ($P742)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("73") :outer("72")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "skip_rest", block
    get_global $P743, "Sub"
setprop block, "$!proto", $P743
    get_hll_global $P744, "Signature"
    $P745 = $P744."!create"()
setprop block, "$!signature", $P745
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "skip_rest"  :multi() :subid("74") :outer("33")
    .param pmc param_749
    new $P748, 'ExceptionHandler'
    set_addr $P748, control_747
    $P748."handle_types"(58)
    push_eh $P748
    .lex "$reason", param_749
    find_lex $P750, "$reason"
    $P751 = new "Perl6Scalar", $P750
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P751, "readonly", $P0
    store_lex "$reason", $P751
    new $P752, "Perl6Scalar"
    .lex "$_", $P752
    new $P753, "Perl6Scalar"
    .lex "$/", $P753
    new $P754, "Perl6Scalar"
    .lex "$!", $P754
    get_global $P755, "$num_of_tests_planned"
    unless_null $P755, vivify_110
    new $P755, "Perl6Scalar"
  vivify_110:
    get_global $P756, "$num_of_tests_run"
    unless_null $P756, vivify_111
    new $P756, "Perl6Scalar"
  vivify_111:
    $P757 = "infix:-"($P755, $P756)
    find_lex $P758, "$reason"
    unless_null $P758, vivify_112
    new $P758, "Perl6Scalar"
  vivify_112:
    $P759 = "skip"($P757, $P758)
    .return ($P759)
  control_747:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P760, exception, "payload"
    .return ($P760)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("75") :outer("74")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "skip_rest", block
    get_global $P761, "Sub"
setprop block, "$!proto", $P761
    get_hll_global $P762, "Signature"
    $P1 = new "Hash"
    new $P763, "String"
    assign $P763, "name"
    new $P764, "String"
    assign $P764, "$reason"
    $P1[$P763] = $P764
    new $P765, "String"
    assign $P765, "multi_invocant"
    new $P766, 'Integer'
    set $P766, 1
    $P1[$P765] = $P766
    new $P767, "String"
    assign $P767, "constraints"
    $P2 = new "List"
    $P768 = $P2
    $P1[$P767] = $P768
    $P769 = $P1
    $P770 = $P762."!create"($P769)
setprop block, "$!signature", $P770
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "diag"  :subid("76") :outer("33")
    .param pmc param_774
    new $P773, 'ExceptionHandler'
    set_addr $P773, control_772
    $P773."handle_types"(58)
    push_eh $P773
    .lex "$message", param_774
    find_lex $P775, "$message"
    $P776 = new "Perl6Scalar", $P775
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P776, "readonly", $P0
    store_lex "$message", $P776
    new $P777, "Perl6Scalar"
    .lex "$_", $P777
    new $P778, "Perl6Scalar"
    .lex "$/", $P778
    new $P779, "Perl6Scalar"
    .lex "$!", $P779
    new $P780, "Perl6Str"
    assign $P780, "# "
    find_lex $P781, "$message"
    unless_null $P781, vivify_113
    new $P781, "Perl6Scalar"
  vivify_113:
    $P782 = "infix:~"($P780, $P781)
    $P783 = "say"($P782)
    .return ($P783)
  control_772:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P784, exception, "payload"
    .return ($P784)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("77") :outer("76")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "diag", block
    get_global $P785, "Sub"
setprop block, "$!proto", $P785
    get_hll_global $P786, "Signature"
    $P1 = new "Hash"
    new $P787, "String"
    assign $P787, "name"
    new $P788, "String"
    assign $P788, "$message"
    $P1[$P787] = $P788
    new $P789, "String"
    assign $P789, "multi_invocant"
    new $P790, 'Integer'
    set $P790, 1
    $P1[$P789] = $P790
    new $P791, "String"
    assign $P791, "constraints"
    $P2 = new "List"
    $P792 = $P2
    $P1[$P791] = $P792
    $P793 = $P1
    $P794 = $P786."!create"($P793)
setprop block, "$!signature", $P794
.end


.namespace []
.sub "flunk"  :multi() :subid("78") :outer("33")
    .param pmc param_798
    new $P797, 'ExceptionHandler'
    set_addr $P797, control_796
    $P797."handle_types"(58)
    push_eh $P797
    .lex "$reason", param_798
    find_lex $P799, "$reason"
    $P800 = new "Perl6Scalar", $P799
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P800, "readonly", $P0
    store_lex "$reason", $P800
    new $P801, "Perl6Scalar"
    .lex "$_", $P801
    new $P802, "Perl6Scalar"
    .lex "$/", $P802
    new $P803, "Perl6Scalar"
    .lex "$!", $P803
    new $P804, "Int"
    assign $P804, 0
    new $P805, "Perl6Str"
    assign $P805, "flunk "
    find_lex $P806, "$reason"
    unless_null $P806, vivify_114
    new $P806, "Perl6Scalar"
  vivify_114:
    $S807 = "prefix:~"($P806)
    concat $P808, $P805, $S807
    $P809 = "proclaim"($P804, $P808)
    .return ($P809)
  control_796:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P810, exception, "payload"
    .return ($P810)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("79") :outer("78")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "flunk", block
    get_global $P811, "Sub"
setprop block, "$!proto", $P811
    get_hll_global $P812, "Signature"
    $P1 = new "Hash"
    new $P813, "String"
    assign $P813, "name"
    new $P814, "String"
    assign $P814, "$reason"
    $P1[$P813] = $P814
    new $P815, "String"
    assign $P815, "multi_invocant"
    new $P816, 'Integer'
    set $P816, 1
    $P1[$P815] = $P816
    new $P817, "String"
    assign $P817, "constraints"
    $P2 = new "List"
    $P818 = $P2
    $P1[$P817] = $P818
    $P819 = $P1
    $P820 = $P812."!create"($P819)
setprop block, "$!signature", $P820
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "isa_ok"  :multi() :subid("80") :outer("33")
    .param pmc param_824
    .param pmc param_827
    new $P823, 'ExceptionHandler'
    set_addr $P823, control_822
    $P823."handle_types"(58)
    push_eh $P823
    .lex "$var", param_824
    find_lex $P825, "$var"
    $P826 = new "Perl6Scalar", $P825
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P826, "readonly", $P0
    store_lex "$var", $P826
    .lex "$type", param_827
    find_lex $P828, "$type"
    $P829 = new "Perl6Scalar", $P828
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P829, "readonly", $P0
    store_lex "$type", $P829
    new $P830, "Perl6Scalar"
    .lex "$_", $P830
    new $P831, "Perl6Scalar"
    .lex "$/", $P831
    new $P832, "Perl6Scalar"
    .lex "$!", $P832
    find_lex $P833, "$var"
    unless_null $P833, vivify_115
    new $P833, "Perl6Scalar"
  vivify_115:
    find_lex $P834, "$type"
    unless_null $P834, vivify_116
    new $P834, "Perl6Scalar"
  vivify_116:
    $P835 = $P833."isa"($P834)
    new $P836, "Perl6Str"
    assign $P836, "The object is-a '"
    find_lex $P837, "$type"
    unless_null $P837, vivify_117
    new $P837, "Perl6Scalar"
  vivify_117:
    $S838 = "prefix:~"($P837)
    concat $P839, $P836, $S838
    new $P840, "Perl6Str"
    assign $P840, "'"
    concat $P841, $P839, $P840
    $P842 = "ok"($P835, $P841)
    .return ($P842)
  control_822:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P843, exception, "payload"
    .return ($P843)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("81") :outer("80")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "isa_ok", block
    get_global $P844, "Sub"
setprop block, "$!proto", $P844
    get_hll_global $P845, "Signature"
    $P1 = new "Hash"
    new $P846, "String"
    assign $P846, "name"
    new $P847, "String"
    assign $P847, "$var"
    $P1[$P846] = $P847
    new $P848, "String"
    assign $P848, "multi_invocant"
    new $P849, 'Integer'
    set $P849, 1
    $P1[$P848] = $P849
    new $P850, "String"
    assign $P850, "constraints"
    $P2 = new "List"
    $P851 = $P2
    $P1[$P850] = $P851
    $P852 = $P1
    $P1 = new "Hash"
    new $P853, "String"
    assign $P853, "name"
    new $P854, "String"
    assign $P854, "$type"
    $P1[$P853] = $P854
    new $P855, "String"
    assign $P855, "multi_invocant"
    new $P856, 'Integer'
    set $P856, 1
    $P1[$P855] = $P856
    new $P857, "String"
    assign $P857, "constraints"
    $P2 = new "List"
    $P858 = $P2
    $P1[$P857] = $P858
    $P859 = $P1
    $P860 = $P845."!create"($P852, $P859)
setprop block, "$!signature", $P860
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "isa_ok"  :multi() :subid("82") :outer("33")
    .param pmc param_864
    .param pmc param_867
    .param pmc param_870
    new $P863, 'ExceptionHandler'
    set_addr $P863, control_862
    $P863."handle_types"(58)
    push_eh $P863
    .lex "$var", param_864
    find_lex $P865, "$var"
    $P866 = new "Perl6Scalar", $P865
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P866, "readonly", $P0
    store_lex "$var", $P866
    .lex "$type", param_867
    find_lex $P868, "$type"
    $P869 = new "Perl6Scalar", $P868
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P869, "readonly", $P0
    store_lex "$type", $P869
    .lex "$msg", param_870
    find_lex $P871, "$msg"
    $P872 = new "Perl6Scalar", $P871
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P872, "readonly", $P0
    store_lex "$msg", $P872
    new $P873, "Perl6Scalar"
    .lex "$_", $P873
    new $P874, "Perl6Scalar"
    .lex "$/", $P874
    new $P875, "Perl6Scalar"
    .lex "$!", $P875
    find_lex $P876, "$var"
    unless_null $P876, vivify_118
    new $P876, "Perl6Scalar"
  vivify_118:
    find_lex $P877, "$type"
    unless_null $P877, vivify_119
    new $P877, "Perl6Scalar"
  vivify_119:
    $P878 = $P876."isa"($P877)
    find_lex $P879, "$msg"
    unless_null $P879, vivify_120
    new $P879, "Perl6Scalar"
  vivify_120:
    $P880 = "ok"($P878, $P879)
    .return ($P880)
  control_862:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P881, exception, "payload"
    .return ($P881)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("83") :outer("82")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "isa_ok", block
    get_global $P882, "Sub"
setprop block, "$!proto", $P882
    get_hll_global $P883, "Signature"
    $P1 = new "Hash"
    new $P884, "String"
    assign $P884, "name"
    new $P885, "String"
    assign $P885, "$var"
    $P1[$P884] = $P885
    new $P886, "String"
    assign $P886, "multi_invocant"
    new $P887, 'Integer'
    set $P887, 1
    $P1[$P886] = $P887
    new $P888, "String"
    assign $P888, "constraints"
    $P2 = new "List"
    $P889 = $P2
    $P1[$P888] = $P889
    $P890 = $P1
    $P1 = new "Hash"
    new $P891, "String"
    assign $P891, "name"
    new $P892, "String"
    assign $P892, "$type"
    $P1[$P891] = $P892
    new $P893, "String"
    assign $P893, "multi_invocant"
    new $P894, 'Integer'
    set $P894, 1
    $P1[$P893] = $P894
    new $P895, "String"
    assign $P895, "constraints"
    $P2 = new "List"
    $P896 = $P2
    $P1[$P895] = $P896
    $P897 = $P1
    $P1 = new "Hash"
    new $P898, "String"
    assign $P898, "name"
    new $P899, "String"
    assign $P899, "$msg"
    $P1[$P898] = $P899
    new $P900, "String"
    assign $P900, "multi_invocant"
    new $P901, 'Integer'
    set $P901, 1
    $P1[$P900] = $P901
    new $P902, "String"
    assign $P902, "constraints"
    $P2 = new "List"
    $P903 = $P2
    $P1[$P902] = $P903
    $P904 = $P1
    $P905 = $P883."!create"($P890, $P897, $P904)
setprop block, "$!signature", $P905
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "dies_ok"  :multi() :subid("84") :outer("33")
    .param pmc param_909
    .param pmc param_912
    new $P908, 'ExceptionHandler'
    set_addr $P908, control_907
    $P908."handle_types"(58)
    push_eh $P908
    .lex "$closure", param_909
    find_lex $P910, "$closure"
    $P911 = new "Perl6Scalar", $P910
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P911, "readonly", $P0
    store_lex "$closure", $P911
    .lex "$reason", param_912
    find_lex $P913, "$reason"
    $P914 = new "Perl6Scalar", $P913
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P914, "readonly", $P0
    store_lex "$reason", $P914
    new $P915, "Perl6Scalar"
    .lex "$_", $P915
    new $P916, "Perl6Scalar"
    .lex "$/", $P916
    new $P917, "Perl6Scalar"
    .lex "$!", $P917
    push_eh catch_918
    .const 'Sub' $P920 = "_block919" 
    capture_lex $P920
    $P920()
    pop_eh 
    new $P927, 'Failure'
    store_lex '$!', $P927
    goto catch_918_end
  catch_918:
    .get_results ($P928)
    store_lex '$!', $P928
    pop_eh 
  catch_918_end:
    find_lex $P929, "$!"
    $P930 = "defined"($P929)
    find_lex $P931, "$reason"
    unless_null $P931, vivify_123
    new $P931, "Perl6Scalar"
  vivify_123:
    $P932 = "proclaim"($P930, $P931)
    .return ($P932)
  control_907:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P933, exception, "payload"
    .return ($P933)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("85") :outer("84")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "dies_ok", block
    get_global $P934, "Sub"
setprop block, "$!proto", $P934
    get_hll_global $P935, "Signature"
    $P1 = new "Hash"
    new $P936, "String"
    assign $P936, "name"
    new $P937, "String"
    assign $P937, "$closure"
    $P1[$P936] = $P937
    new $P938, "String"
    assign $P938, "multi_invocant"
    new $P939, 'Integer'
    set $P939, 1
    $P1[$P938] = $P939
    new $P940, "String"
    assign $P940, "constraints"
    $P2 = new "List"
    $P941 = $P2
    $P1[$P940] = $P941
    $P942 = $P1
    $P1 = new "Hash"
    new $P943, "String"
    assign $P943, "name"
    new $P944, "String"
    assign $P944, "$reason"
    $P1[$P943] = $P944
    new $P945, "String"
    assign $P945, "multi_invocant"
    new $P946, 'Integer'
    set $P946, 1
    $P1[$P945] = $P946
    new $P947, "String"
    assign $P947, "constraints"
    $P2 = new "List"
    $P948 = $P2
    $P1[$P947] = $P948
    $P949 = $P1
    $P950 = $P935."!create"($P942, $P949)
setprop block, "$!signature", $P950
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "_block919"  :anon :subid("86") :outer("84")
    .param pmc param_921 :optional
    .param int has_param_921 :opt_flag
    .local pmc outerlex
    getinterp $P0
    set outerlex, $P0["outer";"lexpad";1]
    if has_param_921, optparam_121
    set $P922, outerlex["$_"]
    set param_921, $P922
  optparam_121:
    .lex "$_", param_921
    set $P923, outerlex["$/"]
    .lex "$/", $P923
    set $P924, outerlex["$!"]
    .lex "$!", $P924
    find_lex $P925, "$closure"
    unless_null $P925, vivify_122
    new $P925, "Perl6Scalar"
  vivify_122:
    $P926 = $P925()
    .return ($P926)
.end


.namespace []
.sub "dies_ok"  :multi() :subid("87") :outer("33")
    .param pmc param_954
    new $P953, 'ExceptionHandler'
    set_addr $P953, control_952
    $P953."handle_types"(58)
    push_eh $P953
    .lex "$closure", param_954
    find_lex $P955, "$closure"
    $P956 = new "Perl6Scalar", $P955
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P956, "readonly", $P0
    store_lex "$closure", $P956
    new $P957, "Perl6Scalar"
    .lex "$_", $P957
    new $P958, "Perl6Scalar"
    .lex "$/", $P958
    new $P959, "Perl6Scalar"
    .lex "$!", $P959
    find_lex $P960, "$closure"
    unless_null $P960, vivify_124
    new $P960, "Perl6Scalar"
  vivify_124:
    new $P961, "Perl6Str"
    assign $P961, ""
    $P962 = "dies_ok"($P960, $P961)
    .return ($P962)
  control_952:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P963, exception, "payload"
    .return ($P963)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("88") :outer("87")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "dies_ok", block
    get_global $P964, "Sub"
setprop block, "$!proto", $P964
    get_hll_global $P965, "Signature"
    $P1 = new "Hash"
    new $P966, "String"
    assign $P966, "name"
    new $P967, "String"
    assign $P967, "$closure"
    $P1[$P966] = $P967
    new $P968, "String"
    assign $P968, "multi_invocant"
    new $P969, 'Integer'
    set $P969, 1
    $P1[$P968] = $P969
    new $P970, "String"
    assign $P970, "constraints"
    $P2 = new "List"
    $P971 = $P2
    $P1[$P970] = $P971
    $P972 = $P1
    $P973 = $P965."!create"($P972)
setprop block, "$!signature", $P973
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "lives_ok"  :multi() :subid("89") :outer("33")
    .param pmc param_977
    .param pmc param_980
    new $P976, 'ExceptionHandler'
    set_addr $P976, control_975
    $P976."handle_types"(58)
    push_eh $P976
    .lex "$closure", param_977
    find_lex $P978, "$closure"
    $P979 = new "Perl6Scalar", $P978
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P979, "readonly", $P0
    store_lex "$closure", $P979
    .lex "$reason", param_980
    find_lex $P981, "$reason"
    $P982 = new "Perl6Scalar", $P981
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P982, "readonly", $P0
    store_lex "$reason", $P982
    new $P983, "Perl6Scalar"
    .lex "$_", $P983
    new $P984, "Perl6Scalar"
    .lex "$/", $P984
    new $P985, "Perl6Scalar"
    .lex "$!", $P985
    push_eh catch_986
    .const 'Sub' $P988 = "_block987" 
    capture_lex $P988
    $P988()
    pop_eh 
    new $P995, 'Failure'
    store_lex '$!', $P995
    goto catch_986_end
  catch_986:
    .get_results ($P996)
    store_lex '$!', $P996
    pop_eh 
  catch_986_end:
    find_lex $P997, "$!"
    $P998 = "defined"($P997)
    $P999 = "not"($P998)
    find_lex $P1000, "$reason"
    unless_null $P1000, vivify_127
    new $P1000, "Perl6Scalar"
  vivify_127:
    $P1001 = "proclaim"($P999, $P1000)
    .return ($P1001)
  control_975:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1002, exception, "payload"
    .return ($P1002)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("90") :outer("89")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "lives_ok", block
    get_global $P1003, "Sub"
setprop block, "$!proto", $P1003
    get_hll_global $P1004, "Signature"
    $P1 = new "Hash"
    new $P1005, "String"
    assign $P1005, "name"
    new $P1006, "String"
    assign $P1006, "$closure"
    $P1[$P1005] = $P1006
    new $P1007, "String"
    assign $P1007, "multi_invocant"
    new $P1008, 'Integer'
    set $P1008, 1
    $P1[$P1007] = $P1008
    new $P1009, "String"
    assign $P1009, "constraints"
    $P2 = new "List"
    $P1010 = $P2
    $P1[$P1009] = $P1010
    $P1011 = $P1
    $P1 = new "Hash"
    new $P1012, "String"
    assign $P1012, "name"
    new $P1013, "String"
    assign $P1013, "$reason"
    $P1[$P1012] = $P1013
    new $P1014, "String"
    assign $P1014, "multi_invocant"
    new $P1015, 'Integer'
    set $P1015, 1
    $P1[$P1014] = $P1015
    new $P1016, "String"
    assign $P1016, "constraints"
    $P2 = new "List"
    $P1017 = $P2
    $P1[$P1016] = $P1017
    $P1018 = $P1
    $P1019 = $P1004."!create"($P1011, $P1018)
setprop block, "$!signature", $P1019
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "_block987"  :anon :subid("91") :outer("89")
    .param pmc param_989 :optional
    .param int has_param_989 :opt_flag
    .local pmc outerlex
    getinterp $P0
    set outerlex, $P0["outer";"lexpad";1]
    if has_param_989, optparam_125
    set $P990, outerlex["$_"]
    set param_989, $P990
  optparam_125:
    .lex "$_", param_989
    set $P991, outerlex["$/"]
    .lex "$/", $P991
    set $P992, outerlex["$!"]
    .lex "$!", $P992
    find_lex $P993, "$closure"
    unless_null $P993, vivify_126
    new $P993, "Perl6Scalar"
  vivify_126:
    $P994 = $P993()
    .return ($P994)
.end


.namespace []
.sub "lives_ok"  :multi() :subid("92") :outer("33")
    .param pmc param_1023
    new $P1022, 'ExceptionHandler'
    set_addr $P1022, control_1021
    $P1022."handle_types"(58)
    push_eh $P1022
    .lex "$closure", param_1023
    find_lex $P1024, "$closure"
    $P1025 = new "Perl6Scalar", $P1024
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1025, "readonly", $P0
    store_lex "$closure", $P1025
    new $P1026, "Perl6Scalar"
    .lex "$_", $P1026
    new $P1027, "Perl6Scalar"
    .lex "$/", $P1027
    new $P1028, "Perl6Scalar"
    .lex "$!", $P1028
    find_lex $P1029, "$closure"
    unless_null $P1029, vivify_128
    new $P1029, "Perl6Scalar"
  vivify_128:
    new $P1030, "Perl6Str"
    assign $P1030, ""
    $P1031 = "lives_ok"($P1029, $P1030)
    .return ($P1031)
  control_1021:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1032, exception, "payload"
    .return ($P1032)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("93") :outer("92")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "lives_ok", block
    get_global $P1033, "Sub"
setprop block, "$!proto", $P1033
    get_hll_global $P1034, "Signature"
    $P1 = new "Hash"
    new $P1035, "String"
    assign $P1035, "name"
    new $P1036, "String"
    assign $P1036, "$closure"
    $P1[$P1035] = $P1036
    new $P1037, "String"
    assign $P1037, "multi_invocant"
    new $P1038, 'Integer'
    set $P1038, 1
    $P1[$P1037] = $P1038
    new $P1039, "String"
    assign $P1039, "constraints"
    $P2 = new "List"
    $P1040 = $P2
    $P1[$P1039] = $P1040
    $P1041 = $P1
    $P1042 = $P1034."!create"($P1041)
setprop block, "$!signature", $P1042
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "eval_dies_ok"  :multi() :subid("94") :outer("33")
    .param pmc param_1046
    .param pmc param_1049
    new $P1045, 'ExceptionHandler'
    set_addr $P1045, control_1044
    $P1045."handle_types"(58)
    push_eh $P1045
    .lex "$code", param_1046
    find_lex $P1047, "$code"
    $P1048 = new "Perl6Scalar", $P1047
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1048, "readonly", $P0
    store_lex "$code", $P1048
    .lex "$reason", param_1049
    find_lex $P1050, "$reason"
    $P1051 = new "Perl6Scalar", $P1050
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1051, "readonly", $P0
    store_lex "$reason", $P1051
    new $P1052, "Perl6Scalar"
    .lex "$_", $P1052
    new $P1053, "Perl6Scalar"
    .lex "$/", $P1053
    new $P1054, "Perl6Scalar"
    .lex "$!", $P1054
    find_lex $P1055, "$code"
    unless_null $P1055, vivify_129
    new $P1055, "Perl6Scalar"
  vivify_129:
    $P1056 = "eval_exception"($P1055)
    $P1057 = "defined"($P1056)
    find_lex $P1058, "$reason"
    unless_null $P1058, vivify_130
    new $P1058, "Perl6Scalar"
  vivify_130:
    $P1059 = "proclaim"($P1057, $P1058)
    .return ($P1059)
  control_1044:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1060, exception, "payload"
    .return ($P1060)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("95") :outer("94")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "eval_dies_ok", block
    get_global $P1061, "Sub"
setprop block, "$!proto", $P1061
    get_hll_global $P1062, "Signature"
    $P1 = new "Hash"
    new $P1063, "String"
    assign $P1063, "name"
    new $P1064, "String"
    assign $P1064, "$code"
    $P1[$P1063] = $P1064
    new $P1065, "String"
    assign $P1065, "multi_invocant"
    new $P1066, 'Integer'
    set $P1066, 1
    $P1[$P1065] = $P1066
    new $P1067, "String"
    assign $P1067, "constraints"
    $P2 = new "List"
    $P1068 = $P2
    $P1[$P1067] = $P1068
    $P1069 = $P1
    $P1 = new "Hash"
    new $P1070, "String"
    assign $P1070, "name"
    new $P1071, "String"
    assign $P1071, "$reason"
    $P1[$P1070] = $P1071
    new $P1072, "String"
    assign $P1072, "multi_invocant"
    new $P1073, 'Integer'
    set $P1073, 1
    $P1[$P1072] = $P1073
    new $P1074, "String"
    assign $P1074, "constraints"
    $P2 = new "List"
    $P1075 = $P2
    $P1[$P1074] = $P1075
    $P1076 = $P1
    $P1077 = $P1062."!create"($P1069, $P1076)
setprop block, "$!signature", $P1077
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "eval_dies_ok"  :multi() :subid("96") :outer("33")
    .param pmc param_1081
    new $P1080, 'ExceptionHandler'
    set_addr $P1080, control_1079
    $P1080."handle_types"(58)
    push_eh $P1080
    .lex "$code", param_1081
    find_lex $P1082, "$code"
    $P1083 = new "Perl6Scalar", $P1082
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1083, "readonly", $P0
    store_lex "$code", $P1083
    new $P1084, "Perl6Scalar"
    .lex "$_", $P1084
    new $P1085, "Perl6Scalar"
    .lex "$/", $P1085
    new $P1086, "Perl6Scalar"
    .lex "$!", $P1086
    find_lex $P1087, "$code"
    unless_null $P1087, vivify_131
    new $P1087, "Perl6Scalar"
  vivify_131:
    new $P1088, "Perl6Str"
    assign $P1088, ""
    $P1089 = "eval_dies_ok"($P1087, $P1088)
    .return ($P1089)
  control_1079:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1090, exception, "payload"
    .return ($P1090)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("97") :outer("96")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "eval_dies_ok", block
    get_global $P1091, "Sub"
setprop block, "$!proto", $P1091
    get_hll_global $P1092, "Signature"
    $P1 = new "Hash"
    new $P1093, "String"
    assign $P1093, "name"
    new $P1094, "String"
    assign $P1094, "$code"
    $P1[$P1093] = $P1094
    new $P1095, "String"
    assign $P1095, "multi_invocant"
    new $P1096, 'Integer'
    set $P1096, 1
    $P1[$P1095] = $P1096
    new $P1097, "String"
    assign $P1097, "constraints"
    $P2 = new "List"
    $P1098 = $P2
    $P1[$P1097] = $P1098
    $P1099 = $P1
    $P1100 = $P1092."!create"($P1099)
setprop block, "$!signature", $P1100
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "eval_lives_ok"  :multi() :subid("98") :outer("33")
    .param pmc param_1104
    .param pmc param_1107
    new $P1103, 'ExceptionHandler'
    set_addr $P1103, control_1102
    $P1103."handle_types"(58)
    push_eh $P1103
    .lex "$code", param_1104
    find_lex $P1105, "$code"
    $P1106 = new "Perl6Scalar", $P1105
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1106, "readonly", $P0
    store_lex "$code", $P1106
    .lex "$reason", param_1107
    find_lex $P1108, "$reason"
    $P1109 = new "Perl6Scalar", $P1108
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1109, "readonly", $P0
    store_lex "$reason", $P1109
    new $P1110, "Perl6Scalar"
    .lex "$_", $P1110
    new $P1111, "Perl6Scalar"
    .lex "$/", $P1111
    new $P1112, "Perl6Scalar"
    .lex "$!", $P1112
    find_lex $P1113, "$code"
    unless_null $P1113, vivify_132
    new $P1113, "Perl6Scalar"
  vivify_132:
    $P1114 = "eval_exception"($P1113)
    $P1115 = "defined"($P1114)
    $P1116 = "not"($P1115)
    find_lex $P1117, "$reason"
    unless_null $P1117, vivify_133
    new $P1117, "Perl6Scalar"
  vivify_133:
    $P1118 = "proclaim"($P1116, $P1117)
    .return ($P1118)
  control_1102:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1119, exception, "payload"
    .return ($P1119)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("99") :outer("98")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "eval_lives_ok", block
    get_global $P1120, "Sub"
setprop block, "$!proto", $P1120
    get_hll_global $P1121, "Signature"
    $P1 = new "Hash"
    new $P1122, "String"
    assign $P1122, "name"
    new $P1123, "String"
    assign $P1123, "$code"
    $P1[$P1122] = $P1123
    new $P1124, "String"
    assign $P1124, "multi_invocant"
    new $P1125, 'Integer'
    set $P1125, 1
    $P1[$P1124] = $P1125
    new $P1126, "String"
    assign $P1126, "constraints"
    $P2 = new "List"
    $P1127 = $P2
    $P1[$P1126] = $P1127
    $P1128 = $P1
    $P1 = new "Hash"
    new $P1129, "String"
    assign $P1129, "name"
    new $P1130, "String"
    assign $P1130, "$reason"
    $P1[$P1129] = $P1130
    new $P1131, "String"
    assign $P1131, "multi_invocant"
    new $P1132, 'Integer'
    set $P1132, 1
    $P1[$P1131] = $P1132
    new $P1133, "String"
    assign $P1133, "constraints"
    $P2 = new "List"
    $P1134 = $P2
    $P1[$P1133] = $P1134
    $P1135 = $P1
    $P1136 = $P1121."!create"($P1128, $P1135)
setprop block, "$!signature", $P1136
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "eval_lives_ok"  :multi() :subid("100") :outer("33")
    .param pmc param_1140
    new $P1139, 'ExceptionHandler'
    set_addr $P1139, control_1138
    $P1139."handle_types"(58)
    push_eh $P1139
    .lex "$code", param_1140
    find_lex $P1141, "$code"
    $P1142 = new "Perl6Scalar", $P1141
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1142, "readonly", $P0
    store_lex "$code", $P1142
    new $P1143, "Perl6Scalar"
    .lex "$_", $P1143
    new $P1144, "Perl6Scalar"
    .lex "$/", $P1144
    new $P1145, "Perl6Scalar"
    .lex "$!", $P1145
    find_lex $P1146, "$code"
    unless_null $P1146, vivify_134
    new $P1146, "Perl6Scalar"
  vivify_134:
    new $P1147, "Perl6Str"
    assign $P1147, ""
    $P1148 = "eval_lives_ok"($P1146, $P1147)
    .return ($P1148)
  control_1138:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1149, exception, "payload"
    .return ($P1149)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("101") :outer("100")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    set_hll_global ["EXPORT";"ALL"], "eval_lives_ok", block
    get_global $P1150, "Sub"
setprop block, "$!proto", $P1150
    get_hll_global $P1151, "Signature"
    $P1 = new "Hash"
    new $P1152, "String"
    assign $P1152, "name"
    new $P1153, "String"
    assign $P1153, "$code"
    $P1[$P1152] = $P1153
    new $P1154, "String"
    assign $P1154, "multi_invocant"
    new $P1155, 'Integer'
    set $P1155, 1
    $P1[$P1154] = $P1155
    new $P1156, "String"
    assign $P1156, "constraints"
    $P2 = new "List"
    $P1157 = $P2
    $P1[$P1156] = $P1157
    $P1158 = $P1
    $P1159 = $P1151."!create"($P1158)
setprop block, "$!signature", $P1159
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "is_deeply"  :multi() :subid("102") :outer("33")
    .param pmc param_1163
    .param pmc param_1166
    .param pmc param_1169
    new $P1162, 'ExceptionHandler'
    set_addr $P1162, control_1161
    $P1162."handle_types"(58)
    push_eh $P1162
    .lex "$this", param_1163
    find_lex $P1164, "$this"
    $P1165 = new "Perl6Scalar", $P1164
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1165, "readonly", $P0
    store_lex "$this", $P1165
    .lex "$that", param_1166
    find_lex $P1167, "$that"
    $P1168 = new "Perl6Scalar", $P1167
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1168, "readonly", $P0
    store_lex "$that", $P1168
    .lex "$reason", param_1169
    find_lex $P1170, "$reason"
    $P1171 = new "Perl6Scalar", $P1170
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1171, "readonly", $P0
    store_lex "$reason", $P1171
    new $P1172, "Perl6Scalar"
    .lex "$_", $P1172
    new $P1173, "Perl6Scalar"
    .lex "$/", $P1173
    new $P1174, "Perl6Scalar"
    .lex "$!", $P1174
    new $P1175, "Perl6Scalar"
    .lex "$val", $P1175
    find_lex $P1176, "$this"
    unless_null $P1176, vivify_135
    new $P1176, "Perl6Scalar"
  vivify_135:
    find_lex $P1177, "$that"
    unless_null $P1177, vivify_136
    new $P1177, "Perl6Scalar"
  vivify_136:
    $P1178 = "_is_deeply"($P1176, $P1177)
    "infix:="($P1175, $P1178)
    find_lex $P1179, "$val"
    unless_null $P1179, vivify_137
    new $P1179, "Perl6Scalar"
  vivify_137:
    find_lex $P1180, "$reason"
    unless_null $P1180, vivify_138
    new $P1180, "Perl6Scalar"
  vivify_138:
    find_lex $P1181, "$this"
    unless_null $P1181, vivify_139
    new $P1181, "Perl6Scalar"
  vivify_139:
    $P1182 = $P1181."perl"()
    find_lex $P1183, "$that"
    unless_null $P1183, vivify_140
    new $P1183, "Perl6Scalar"
  vivify_140:
    $P1184 = $P1183."perl"()
    $P1185 = "proclaim"($P1179, $P1180, $P1182, $P1184)
    .return ($P1185)
  control_1161:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1186, exception, "payload"
    .return ($P1186)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("103") :outer("102")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    get_global $P1187, "Sub"
setprop block, "$!proto", $P1187
    get_hll_global $P1188, "Signature"
    $P1 = new "Hash"
    new $P1189, "String"
    assign $P1189, "name"
    new $P1190, "String"
    assign $P1190, "$this"
    $P1[$P1189] = $P1190
    new $P1191, "String"
    assign $P1191, "multi_invocant"
    new $P1192, 'Integer'
    set $P1192, 1
    $P1[$P1191] = $P1192
    new $P1193, "String"
    assign $P1193, "constraints"
    $P2 = new "List"
    $P1194 = $P2
    $P1[$P1193] = $P1194
    $P1195 = $P1
    $P1 = new "Hash"
    new $P1196, "String"
    assign $P1196, "name"
    new $P1197, "String"
    assign $P1197, "$that"
    $P1[$P1196] = $P1197
    new $P1198, "String"
    assign $P1198, "multi_invocant"
    new $P1199, 'Integer'
    set $P1199, 1
    $P1[$P1198] = $P1199
    new $P1200, "String"
    assign $P1200, "constraints"
    $P2 = new "List"
    $P1201 = $P2
    $P1[$P1200] = $P1201
    $P1202 = $P1
    $P1 = new "Hash"
    new $P1203, "String"
    assign $P1203, "name"
    new $P1204, "String"
    assign $P1204, "$reason"
    $P1[$P1203] = $P1204
    new $P1205, "String"
    assign $P1205, "multi_invocant"
    new $P1206, 'Integer'
    set $P1206, 1
    $P1[$P1205] = $P1206
    new $P1207, "String"
    assign $P1207, "constraints"
    $P2 = new "List"
    $P1208 = $P2
    $P1[$P1207] = $P1208
    $P1209 = $P1
    $P1210 = $P1188."!create"($P1195, $P1202, $P1209)
setprop block, "$!signature", $P1210
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "is_deeply"  :multi() :subid("104") :outer("33")
    .param pmc param_1214
    .param pmc param_1217
    new $P1213, 'ExceptionHandler'
    set_addr $P1213, control_1212
    $P1213."handle_types"(58)
    push_eh $P1213
    .lex "$this", param_1214
    find_lex $P1215, "$this"
    $P1216 = new "Perl6Scalar", $P1215
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1216, "readonly", $P0
    store_lex "$this", $P1216
    .lex "$that", param_1217
    find_lex $P1218, "$that"
    $P1219 = new "Perl6Scalar", $P1218
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1219, "readonly", $P0
    store_lex "$that", $P1219
    new $P1220, "Perl6Scalar"
    .lex "$_", $P1220
    new $P1221, "Perl6Scalar"
    .lex "$/", $P1221
    new $P1222, "Perl6Scalar"
    .lex "$!", $P1222
    new $P1223, "Perl6Scalar"
    .lex "$val", $P1223
    find_lex $P1224, "$this"
    unless_null $P1224, vivify_141
    new $P1224, "Perl6Scalar"
  vivify_141:
    find_lex $P1225, "$that"
    unless_null $P1225, vivify_142
    new $P1225, "Perl6Scalar"
  vivify_142:
    $P1226 = "_is_deeply"($P1224, $P1225)
    "infix:="($P1223, $P1226)
    find_lex $P1227, "$val"
    unless_null $P1227, vivify_143
    new $P1227, "Perl6Scalar"
  vivify_143:
    new $P1228, "Perl6Str"
    assign $P1228, ""
    find_lex $P1229, "$this"
    unless_null $P1229, vivify_144
    new $P1229, "Perl6Scalar"
  vivify_144:
    $P1230 = $P1229."perl"()
    find_lex $P1231, "$that"
    unless_null $P1231, vivify_145
    new $P1231, "Perl6Scalar"
  vivify_145:
    $P1232 = $P1231."perl"()
    $P1233 = "proclaim"($P1227, $P1228, $P1230, $P1232)
    .return ($P1233)
  control_1212:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1234, exception, "payload"
    .return ($P1234)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("105") :outer("104")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    get_global $P1235, "Sub"
setprop block, "$!proto", $P1235
    get_hll_global $P1236, "Signature"
    $P1 = new "Hash"
    new $P1237, "String"
    assign $P1237, "name"
    new $P1238, "String"
    assign $P1238, "$this"
    $P1[$P1237] = $P1238
    new $P1239, "String"
    assign $P1239, "multi_invocant"
    new $P1240, 'Integer'
    set $P1240, 1
    $P1[$P1239] = $P1240
    new $P1241, "String"
    assign $P1241, "constraints"
    $P2 = new "List"
    $P1242 = $P2
    $P1[$P1241] = $P1242
    $P1243 = $P1
    $P1 = new "Hash"
    new $P1244, "String"
    assign $P1244, "name"
    new $P1245, "String"
    assign $P1245, "$that"
    $P1[$P1244] = $P1245
    new $P1246, "String"
    assign $P1246, "multi_invocant"
    new $P1247, 'Integer'
    set $P1247, 1
    $P1[$P1246] = $P1247
    new $P1248, "String"
    assign $P1248, "constraints"
    $P2 = new "List"
    $P1249 = $P2
    $P1[$P1248] = $P1249
    $P1250 = $P1
    $P1251 = $P1236."!create"($P1243, $P1250)
setprop block, "$!signature", $P1251
    "!TOPERL6MULTISUB"(block)
.end


.namespace []
.sub "_is_deeply"  :subid("106") :outer("33")
    .param pmc param_1255
    .param pmc param_1258
    new $P1254, 'ExceptionHandler'
    set_addr $P1254, control_1253
    $P1254."handle_types"(58)
    push_eh $P1254
    .lex "$this", param_1255
    find_lex $P1256, "$this"
    $P1257 = new "Perl6Scalar", $P1256
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1257, "readonly", $P0
    store_lex "$this", $P1257
    .lex "$that", param_1258
    find_lex $P1259, "$that"
    $P1260 = new "Perl6Scalar", $P1259
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1260, "readonly", $P0
    store_lex "$that", $P1260
    new $P1261, "Perl6Scalar"
    .lex "$_", $P1261
    new $P1262, "Perl6Scalar"
    .lex "$/", $P1262
    new $P1263, "Perl6Scalar"
    .lex "$!", $P1263
    find_lex $P1268, "$this"
    unless_null $P1268, vivify_146
    new $P1268, "Perl6Scalar"
  vivify_146:
    get_hll_global $P1269, "Array"
    unless_null $P1269, vivify_147
    new $P1269, "Failure"
  vivify_147:
    $P1267 = "infix:~~"($P1268, $P1269)
  chain_end_148:
    if $P1267, if_1266
    set $P1265, $P1267
    goto if_1266_end
  if_1266:
    find_lex $P1271, "$that"
    unless_null $P1271, vivify_149
    new $P1271, "Perl6Scalar"
  vivify_149:
    get_hll_global $P1272, "Array"
    unless_null $P1272, vivify_150
    new $P1272, "Failure"
  vivify_150:
    $P1270 = "infix:~~"($P1271, $P1272)
  chain_end_151:
    set $P1265, $P1270
  if_1266_end:
    if $P1265, if_1264
    find_lex $P1321, "$this"
    unless_null $P1321, vivify_152
    new $P1321, "Perl6Scalar"
  vivify_152:
    get_hll_global $P1322, "Hash"
    unless_null $P1322, vivify_153
    new $P1322, "Failure"
  vivify_153:
    $P1320 = "infix:~~"($P1321, $P1322)
  chain_end_154:
    if $P1320, if_1319
    set $P1318, $P1320
    goto if_1319_end
  if_1319:
    find_lex $P1324, "$that"
    unless_null $P1324, vivify_155
    new $P1324, "Perl6Scalar"
  vivify_155:
    get_hll_global $P1325, "Hash"
    unless_null $P1325, vivify_156
    new $P1325, "Failure"
  vivify_156:
    $P1323 = "infix:~~"($P1324, $P1325)
  chain_end_157:
    set $P1318, $P1323
  if_1319_end:
    if $P1318, if_1317
    find_lex $P1386, "$this"
    unless_null $P1386, vivify_158
    new $P1386, "Perl6Scalar"
  vivify_158:
    get_hll_global $P1387, "Str"
    unless_null $P1387, vivify_159
    new $P1387, "Failure"
  vivify_159:
    get_hll_global $P1388, "Num"
    unless_null $P1388, vivify_160
    new $P1388, "Failure"
  vivify_160:
    get_hll_global $P1389, "Int"
    unless_null $P1389, vivify_161
    new $P1389, "Failure"
  vivify_161:
    $P1390 = "infix:|"($P1387, $P1388, $P1389)
    $P1385 = "infix:~~"($P1386, $P1390)
  chain_end_162:
    if $P1385, if_1384
    set $P1383, $P1385
    goto if_1384_end
  if_1384:
    find_lex $P1392, "$that"
    unless_null $P1392, vivify_163
    new $P1392, "Perl6Scalar"
  vivify_163:
    get_hll_global $P1393, "Str"
    unless_null $P1393, vivify_164
    new $P1393, "Failure"
  vivify_164:
    get_hll_global $P1394, "Num"
    unless_null $P1394, vivify_165
    new $P1394, "Failure"
  vivify_165:
    get_hll_global $P1395, "Int"
    unless_null $P1395, vivify_166
    new $P1395, "Failure"
  vivify_166:
    $P1396 = "infix:|"($P1393, $P1394, $P1395)
    $P1391 = "infix:~~"($P1392, $P1396)
  chain_end_167:
    set $P1383, $P1391
  if_1384_end:
    if $P1383, if_1382
    find_lex $P1410, "$this"
    unless_null $P1410, vivify_168
    new $P1410, "Perl6Scalar"
  vivify_168:
    get_hll_global $P1411, "Pair"
    unless_null $P1411, vivify_169
    new $P1411, "Failure"
  vivify_169:
    $P1409 = "infix:~~"($P1410, $P1411)
  chain_end_170:
    if $P1409, if_1408
    set $P1407, $P1409
    goto if_1408_end
  if_1408:
    find_lex $P1413, "$that"
    unless_null $P1413, vivify_171
    new $P1413, "Perl6Scalar"
  vivify_171:
    get_hll_global $P1414, "Pair"
    unless_null $P1414, vivify_172
    new $P1414, "Failure"
  vivify_172:
    $P1412 = "infix:~~"($P1413, $P1414)
  chain_end_173:
    set $P1407, $P1412
  if_1408_end:
    if $P1407, if_1406
    find_lex $P1439, "$this"
    unless_null $P1439, vivify_174
    new $P1439, "Perl6Scalar"
  vivify_174:
    $P1440 = "undef"()
    $P1438 = "infix:~~"($P1439, $P1440)
  chain_end_175:
    if $P1438, if_1437
    set $P1436, $P1438
    goto if_1437_end
  if_1437:
    find_lex $P1442, "$that"
    unless_null $P1442, vivify_176
    new $P1442, "Perl6Scalar"
  vivify_176:
    $P1443 = "undef"()
    $P1441 = "infix:~~"($P1442, $P1443)
  chain_end_177:
    set $P1436, $P1441
  if_1437_end:
    if $P1436, if_1435
    set $P1434, $P1436
    goto if_1435_end
  if_1435:
    find_lex $P1445, "$this"
    unless_null $P1445, vivify_178
    new $P1445, "Perl6Scalar"
  vivify_178:
    $P1446 = $P1445."WHAT"()
    find_lex $P1447, "$that"
    unless_null $P1447, vivify_179
    new $P1447, "Perl6Scalar"
  vivify_179:
    $P1448 = $P1447."WHAT"()
    $P1444 = "infix:eq"($P1446, $P1448)
  chain_end_180:
    set $P1434, $P1444
  if_1435_end:
    unless $P1434, if_1433_end
    .const 'Sub' $P1450 = "_block1449" 
    capture_lex $P1450
    $P1450()
  if_1433_end:
    goto if_1406_end
  if_1406:
    .const 'Sub' $P1416 = "_block1415" 
    capture_lex $P1416
    $P1416()
  if_1406_end:
    goto if_1382_end
  if_1382:
    .const 'Sub' $P1398 = "_block1397" 
    capture_lex $P1398
    $P1398()
  if_1382_end:
    goto if_1317_end
  if_1317:
    .const 'Sub' $P1327 = "_block1326" 
    capture_lex $P1327
    $P1327()
  if_1317_end:
    goto if_1264_end
  if_1264:
    .const 'Sub' $P1274 = "_block1273" 
    capture_lex $P1274
    $P1274()
  if_1264_end:
    $P1456 = "return"()
    .return ($P1456)
  control_1253:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1457, exception, "payload"
    .return ($P1457)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("107") :outer("106")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    get_global $P1458, "Sub"
setprop block, "$!proto", $P1458
    get_hll_global $P1459, "Signature"
    $P1 = new "Hash"
    new $P1460, "String"
    assign $P1460, "name"
    new $P1461, "String"
    assign $P1461, "$this"
    $P1[$P1460] = $P1461
    new $P1462, "String"
    assign $P1462, "multi_invocant"
    new $P1463, 'Integer'
    set $P1463, 1
    $P1[$P1462] = $P1463
    new $P1464, "String"
    assign $P1464, "constraints"
    $P2 = new "List"
    $P1465 = $P2
    $P1[$P1464] = $P1465
    $P1466 = $P1
    $P1 = new "Hash"
    new $P1467, "String"
    assign $P1467, "name"
    new $P1468, "String"
    assign $P1468, "$that"
    $P1[$P1467] = $P1468
    new $P1469, "String"
    assign $P1469, "multi_invocant"
    new $P1470, 'Integer'
    set $P1470, 1
    $P1[$P1469] = $P1470
    new $P1471, "String"
    assign $P1471, "constraints"
    $P2 = new "List"
    $P1472 = $P2
    $P1[$P1471] = $P1472
    $P1473 = $P1
    $P1474 = $P1459."!create"($P1466, $P1473)
setprop block, "$!signature", $P1474
.end


.namespace []
.sub "_block1449"  :anon :subid("108") :outer("106")
    .local pmc outerlex
    getinterp $P0
    set outerlex, $P0["outer";"lexpad";1]
    set $P1451, outerlex["$_"]
    .lex "$_", $P1451
    set $P1452, outerlex["$/"]
    .lex "$/", $P1452
    set $P1453, outerlex["$!"]
    .lex "$!", $P1453
    get_hll_global $P1454, "True"
    unless_null $P1454, vivify_181
    new $P1454, "Failure"
  vivify_181:
    $P1455 = "return"($P1454)
    .return ($P1455)
.end


.namespace []
.sub "_block1415"  :anon :subid("109") :outer("106")
    .local pmc outerlex
    getinterp $P0
    set outerlex, $P0["outer";"lexpad";1]
    set $P1417, outerlex["$_"]
    .lex "$_", $P1417
    set $P1418, outerlex["$/"]
    .lex "$/", $P1418
    set $P1419, outerlex["$!"]
    .lex "$!", $P1419
    find_lex $P1423, "$this"
    unless_null $P1423, vivify_182
    new $P1423, "Perl6Scalar"
  vivify_182:
    $P1424 = $P1423."key"()
    find_lex $P1425, "$that"
    unless_null $P1425, vivify_183
    new $P1425, "Perl6Scalar"
  vivify_183:
    $P1426 = $P1425."key"()
    $P1422 = "infix:eq"($P1424, $P1426)
  chain_end_184:
    if $P1422, if_1421
    set $P1420, $P1422
    goto if_1421_end
  if_1421:
    find_lex $P1427, "$this"
    unless_null $P1427, vivify_185
    new $P1427, "Perl6Scalar"
  vivify_185:
    $P1428 = $P1427."value"()
    find_lex $P1429, "$this"
    unless_null $P1429, vivify_186
    new $P1429, "Perl6Scalar"
  vivify_186:
    $P1430 = $P1429."value"()
    $P1431 = "_is_deeply"($P1428, $P1430)
    set $P1420, $P1431
  if_1421_end:
    $P1432 = "return"($P1420)
    .return ($P1432)
.end


.namespace []
.sub "_block1397"  :anon :subid("110") :outer("106")
    .local pmc outerlex
    getinterp $P0
    set outerlex, $P0["outer";"lexpad";1]
    set $P1399, outerlex["$_"]
    .lex "$_", $P1399
    set $P1400, outerlex["$/"]
    .lex "$/", $P1400
    set $P1401, outerlex["$!"]
    .lex "$!", $P1401
    find_lex $P1403, "$this"
    unless_null $P1403, vivify_187
    new $P1403, "Perl6Scalar"
  vivify_187:
    find_lex $P1404, "$that"
    unless_null $P1404, vivify_188
    new $P1404, "Perl6Scalar"
  vivify_188:
    $P1402 = "infix:eq"($P1403, $P1404)
  chain_end_189:
    $P1405 = "return"($P1402)
    .return ($P1405)
.end


.namespace []
.sub "_block1326"  :anon :subid("111") :outer("106")
    .local pmc outerlex
    getinterp $P0
    set outerlex, $P0["outer";"lexpad";1]
    set $P1328, outerlex["$_"]
    .lex "$_", $P1328
    set $P1329, outerlex["$/"]
    .lex "$/", $P1329
    set $P1330, outerlex["$!"]
    .lex "$!", $P1330
    find_lex $P1333, "$this"
    unless_null $P1333, vivify_190
    new $P1333, "Perl6Scalar"
  vivify_190:
    $P1334 = $P1333."keys"()
    $P1335 = "prefix:+"($P1334)
    find_lex $P1336, "$that"
    unless_null $P1336, vivify_191
    new $P1336, "Perl6Scalar"
  vivify_191:
    $P1337 = $P1336."keys"()
    $P1338 = "prefix:+"($P1337)
    $P1332 = "infix:!="($P1335, $P1338)
  chain_end_192:
    unless $P1332, if_1331_end
    "return"()
  if_1331_end:
    find_lex $P1340, "$this"
    unless_null $P1340, vivify_193
    new $P1340, "Perl6Scalar"
  vivify_193:
    $P1341 = $P1340."keys"()
    $P1342 = $P1341."sort"()
    find_lex $P1343, "$that"
    unless_null $P1343, vivify_194
    new $P1343, "Perl6Scalar"
  vivify_194:
    $P1344 = $P1343."keys"()
    $P1345 = $P1344."sort"()
    $P1346 = "infix:Z"($P1342, $P1345)
    $P1347 = "list"($P1346)
    defined $I1349, $P1347
    unless $I1349, for_1339_undef_iter
    new $P1350, 'ExceptionHandler'
    set_addr $P1350, for_1339_next
    $P1350."handle_types"(64)
    push_eh $P1350
    iter $P1348, $P1347
  for_1339:
    unless $P1348, for_1339_end
    shift $P1351, $P1348
    shift $P1352, $P1348
    .const 'Sub' $P1354 = "_block1353" 
    capture_lex $P1354
    $P1379 = $P1354($P1351, $P1352)
    goto for_1339
  for_1339_next:
    .local pmc exception 
    .get_results (exception) 
    set $P1350, 0
    goto for_1339
  for_1339_end:
    pop_eh 
  for_1339_undef_iter:
    get_hll_global $P1380, "True"
    unless_null $P1380, vivify_204
    new $P1380, "Failure"
  vivify_204:
    $P1381 = "return"($P1380)
    .return ($P1381)
.end


.namespace []
.sub "_block1353"  :anon :subid("112") :outer("111")
    .param pmc param_1355
    .param pmc param_1358
    .lex "$a", param_1355
    find_lex $P1356, "$a"
    $P1357 = new "Perl6Scalar", $P1356
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1357, "readonly", $P0
    store_lex "$a", $P1357
    .lex "$b", param_1358
    find_lex $P1359, "$b"
    $P1360 = new "Perl6Scalar", $P1359
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1360, "readonly", $P0
    store_lex "$b", $P1360
    .local pmc outerlex
    getinterp $P0
    set outerlex, $P0["outer";"lexpad";1]
    set $P1361, outerlex["$_"]
    .lex "$_", $P1361
    set $P1362, outerlex["$/"]
    .lex "$/", $P1362
    set $P1363, outerlex["$!"]
    .lex "$!", $P1363
    find_lex $P1366, "$a"
    unless_null $P1366, vivify_195
    new $P1366, "Perl6Scalar"
  vivify_195:
    find_lex $P1367, "$b"
    unless_null $P1367, vivify_196
    new $P1367, "Perl6Scalar"
  vivify_196:
    $P1365 = "infix:ne"($P1366, $P1367)
  chain_end_197:
    unless $P1365, if_1364_end
    "return"()
  if_1364_end:
    find_lex $P1370, "$a"
    unless_null $P1370, vivify_198
    new $P1370, "Perl6Scalar"
  vivify_198:
    find_lex $P1371, "$this"
    unless_null $P1371, vivify_199
    new $P1371, "Perl6Scalar"
  vivify_199:
    set $P1372, $P1371[$P1370]
    unless_null $P1372, vivify_200
    new $P1372, "Failure"
  vivify_200:
    find_lex $P1373, "$b"
    unless_null $P1373, vivify_201
    new $P1373, "Perl6Scalar"
  vivify_201:
    find_lex $P1374, "$that"
    unless_null $P1374, vivify_202
    new $P1374, "Perl6Scalar"
  vivify_202:
    set $P1375, $P1374[$P1373]
    unless_null $P1375, vivify_203
    new $P1375, "Failure"
  vivify_203:
    $P1376 = "_is_deeply"($P1372, $P1375)
    $P1377 = "prefix:!"($P1376)
    if $P1377, if_1369
    set $P1368, $P1377
    goto if_1369_end
  if_1369:
    $P1378 = "return"()
    set $P1368, $P1378
  if_1369_end:
    .return ($P1368)
.end


.namespace []
.sub "_block1273"  :anon :subid("113") :outer("106")
    .local pmc outerlex
    getinterp $P0
    set outerlex, $P0["outer";"lexpad";1]
    set $P1275, outerlex["$_"]
    .lex "$_", $P1275
    set $P1276, outerlex["$/"]
    .lex "$/", $P1276
    set $P1277, outerlex["$!"]
    .lex "$!", $P1277
    find_lex $P1280, "$this"
    unless_null $P1280, vivify_205
    new $P1280, "Perl6Scalar"
  vivify_205:
    $P1281 = $P1280."values"()
    $P1282 = "prefix:+"($P1281)
    find_lex $P1283, "$that"
    unless_null $P1283, vivify_206
    new $P1283, "Perl6Scalar"
  vivify_206:
    $P1284 = $P1283."values"()
    $P1285 = "prefix:+"($P1284)
    $P1279 = "infix:!="($P1282, $P1285)
  chain_end_207:
    unless $P1279, if_1278_end
    "return"()
  if_1278_end:
    find_lex $P1287, "$this"
    unless_null $P1287, vivify_208
    new $P1287, "Perl6Scalar"
  vivify_208:
    find_lex $P1288, "$that"
    unless_null $P1288, vivify_209
    new $P1288, "Perl6Scalar"
  vivify_209:
    $P1289 = "infix:Z"($P1287, $P1288)
    $P1290 = "list"($P1289)
    defined $I1292, $P1290
    unless $I1292, for_1286_undef_iter
    new $P1293, 'ExceptionHandler'
    set_addr $P1293, for_1286_next
    $P1293."handle_types"(64)
    push_eh $P1293
    iter $P1291, $P1290
  for_1286:
    unless $P1291, for_1286_end
    shift $P1294, $P1291
    shift $P1295, $P1291
    .const 'Sub' $P1297 = "_block1296" 
    capture_lex $P1297
    $P1314 = $P1297($P1294, $P1295)
    goto for_1286
  for_1286_next:
    .local pmc exception 
    .get_results (exception) 
    set $P1293, 0
    goto for_1286
  for_1286_end:
    pop_eh 
  for_1286_undef_iter:
    get_hll_global $P1315, "True"
    unless_null $P1315, vivify_212
    new $P1315, "Failure"
  vivify_212:
    $P1316 = "return"($P1315)
    .return ($P1316)
.end


.namespace []
.sub "_block1296"  :anon :subid("114") :outer("113")
    .param pmc param_1298
    .param pmc param_1301
    .lex "$a", param_1298
    find_lex $P1299, "$a"
    $P1300 = new "Perl6Scalar", $P1299
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1300, "readonly", $P0
    store_lex "$a", $P1300
    .lex "$b", param_1301
    find_lex $P1302, "$b"
    $P1303 = new "Perl6Scalar", $P1302
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1303, "readonly", $P0
    store_lex "$b", $P1303
    .local pmc outerlex
    getinterp $P0
    set outerlex, $P0["outer";"lexpad";1]
    set $P1304, outerlex["$_"]
    .lex "$_", $P1304
    set $P1305, outerlex["$/"]
    .lex "$/", $P1305
    set $P1306, outerlex["$!"]
    .lex "$!", $P1306
    find_lex $P1309, "$a"
    unless_null $P1309, vivify_210
    new $P1309, "Perl6Scalar"
  vivify_210:
    find_lex $P1310, "$b"
    unless_null $P1310, vivify_211
    new $P1310, "Perl6Scalar"
  vivify_211:
    $P1311 = "_is_deeply"($P1309, $P1310)
    $P1312 = "prefix:!"($P1311)
    if $P1312, if_1308
    set $P1307, $P1312
    goto if_1308_end
  if_1308:
    $P1313 = "return"()
    set $P1307, $P1313
  if_1308_end:
    .return ($P1307)
.end


.namespace []
.sub "eval_exception"  :subid("115") :outer("33")
    .param pmc param_1478
    new $P1477, 'ExceptionHandler'
    set_addr $P1477, control_1476
    $P1477."handle_types"(58)
    push_eh $P1477
    .lex "$code", param_1478
    find_lex $P1479, "$code"
    $P1480 = new "Perl6Scalar", $P1479
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1480, "readonly", $P0
    store_lex "$code", $P1480
    new $P1481, "Perl6Scalar"
    .lex "$_", $P1481
    new $P1482, "Perl6Scalar"
    .lex "$/", $P1482
    new $P1483, "Perl6Scalar"
    .lex "$!", $P1483
    new $P1484, "Perl6Scalar"
    .lex "$eval_exception", $P1484
    push_eh catch_1485
    .const 'Sub' $P1487 = "_block1486" 
    capture_lex $P1487
    $P1487()
    pop_eh 
    new $P1496, 'Failure'
    store_lex '$!', $P1496
    goto catch_1485_end
  catch_1485:
    .get_results ($P1497)
    store_lex '$!', $P1497
    pop_eh 
  catch_1485_end:
    find_lex $P1499, "$eval_exception"
    unless_null $P1499, vivify_216
    new $P1499, "Perl6Scalar"
  vivify_216:
    set $P1498, $P1499
    defined $I1501, $P1498
    if $I1501, default_1500
    find_lex $P1502, "$!"
    set $P1498, $P1502
  default_1500:
    .return ($P1498)
  control_1476:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1503, exception, "payload"
    .return ($P1503)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("116") :outer("115")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    get_global $P1504, "Sub"
setprop block, "$!proto", $P1504
    get_hll_global $P1505, "Signature"
    $P1 = new "Hash"
    new $P1506, "String"
    assign $P1506, "name"
    new $P1507, "String"
    assign $P1507, "$code"
    $P1[$P1506] = $P1507
    new $P1508, "String"
    assign $P1508, "multi_invocant"
    new $P1509, 'Integer'
    set $P1509, 1
    $P1[$P1508] = $P1509
    new $P1510, "String"
    assign $P1510, "constraints"
    $P2 = new "List"
    $P1511 = $P2
    $P1[$P1510] = $P1511
    $P1512 = $P1
    $P1513 = $P1505."!create"($P1512)
setprop block, "$!signature", $P1513
.end


.namespace []
.sub "_block1486"  :anon :subid("117") :outer("115")
    .param pmc param_1488 :optional
    .param int has_param_1488 :opt_flag
    .local pmc outerlex
    getinterp $P0
    set outerlex, $P0["outer";"lexpad";1]
    if has_param_1488, optparam_213
    set $P1489, outerlex["$_"]
    set param_1488, $P1489
  optparam_213:
    .lex "$_", param_1488
    set $P1490, outerlex["$/"]
    .lex "$/", $P1490
    set $P1491, outerlex["$!"]
    .lex "$!", $P1491
    find_lex $P1492, "$code"
    unless_null $P1492, vivify_214
    new $P1492, "Perl6Scalar"
  vivify_214:
    "eval"($P1492)
    find_lex $P1493, "$eval_exception"
    unless_null $P1493, vivify_215
    new $P1493, "Perl6Scalar"
    store_lex "$eval_exception", $P1493
  vivify_215:
    find_lex $P1494, "$!"
    $P1495 = "infix:="($P1493, $P1494)
    .return ($P1495)
.end


.namespace []
.sub "proclaim"  :subid("118") :outer("33")
    .param pmc param_1517
    .param pmc param_1520
    new $P1516, 'ExceptionHandler'
    set_addr $P1516, control_1515
    $P1516."handle_types"(58)
    push_eh $P1516
    .lex "$cond", param_1517
    find_lex $P1518, "$cond"
    $P1519 = new "Perl6Scalar", $P1518
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1519, "readonly", $P0
    store_lex "$cond", $P1519
    .lex "$desc", param_1520
    find_lex $P1521, "$desc"
    $P1522 = new "Perl6Scalar", $P1521
    $P0 = get_hll_global ["Bool"], "True"
    setprop $P1522, "readonly", $P0
    store_lex "$desc", $P1522
    new $P1523, "Perl6Scalar"
    .lex "$_", $P1523
    new $P1524, "Perl6Scalar"
    .lex "$/", $P1524
    new $P1525, "Perl6Scalar"
    .lex "$!", $P1525
    get_global $P1526, "$testing_started"
    unless_null $P1526, vivify_217
    new $P1526, "Perl6Scalar"
    set_global "$testing_started", $P1526
  vivify_217:
    new $P1527, "Int"
    assign $P1527, 1
    "infix:="($P1526, $P1527)
    get_global $P1528, "$num_of_tests_run"
    unless_null $P1528, vivify_218
    new $P1528, "Perl6Scalar"
    set_global "$num_of_tests_run", $P1528
  vivify_218:
    get_global $P1529, "$num_of_tests_run"
    unless_null $P1529, vivify_219
    new $P1529, "Perl6Scalar"
  vivify_219:
    new $P1530, "Int"
    assign $P1530, 1
    $P1531 = "infix:+"($P1529, $P1530)
    "infix:="($P1528, $P1531)
    find_lex $P1533, "$cond"
    unless_null $P1533, vivify_220
    new $P1533, "Perl6Scalar"
  vivify_220:
    if $P1533, unless_1532_end
    .const 'Sub' $P1535 = "_block1534" 
    capture_lex $P1535
    $P1535()
  unless_1532_end:
    new $P1550, "Perl6Str"
    assign $P1550, "ok "
    get_global $P1551, "$num_of_tests_run"
    unless_null $P1551, vivify_226
    new $P1551, "Perl6Scalar"
  vivify_226:
    new $P1552, "Perl6Str"
    assign $P1552, " - "
    find_lex $P1553, "$desc"
    unless_null $P1553, vivify_227
    new $P1553, "Perl6Scalar"
  vivify_227:
    "print"($P1550, $P1551, $P1552, $P1553)
    get_global $P1557, "$todo_reason"
    unless_null $P1557, vivify_228
    new $P1557, "Perl6Scalar"
  vivify_228:
    if $P1557, if_1556
    set $P1555, $P1557
    goto if_1556_end
  if_1556:
    get_global $P1559, "$num_of_tests_run"
    unless_null $P1559, vivify_229
    new $P1559, "Perl6Scalar"
  vivify_229:
    get_global $P1560, "$todo_upto_test_num"
    unless_null $P1560, vivify_230
    new $P1560, "Perl6Scalar"
  vivify_230:
    $P1558 = "infix:<="($P1559, $P1560)
  chain_end_231:
    set $P1555, $P1558
  if_1556_end:
    unless $P1555, if_1554_end
    .const 'Sub' $P1562 = "_block1561" 
    capture_lex $P1562
    $P1562()
  if_1554_end:
    new $P1568, "Perl6Str"
    assign $P1568, "\n"
    $P1569 = "print"($P1568)
    .return ($P1569)
  control_1515:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1570, exception, "payload"
    .return ($P1570)
    rethrow exception
.end


.namespace []
.sub "" :load :init :subid("119") :outer("118")
    .local pmc block
    interpinfo $P20, 15
    block = $P20."get_outer"()
    get_global $P1571, "Sub"
setprop block, "$!proto", $P1571
    get_hll_global $P1572, "Signature"
    $P1 = new "Hash"
    new $P1573, "String"
    assign $P1573, "name"
    new $P1574, "String"
    assign $P1574, "$cond"
    $P1[$P1573] = $P1574
    new $P1575, "String"
    assign $P1575, "multi_invocant"
    new $P1576, 'Integer'
    set $P1576, 1
    $P1[$P1575] = $P1576
    new $P1577, "String"
    assign $P1577, "constraints"
    $P2 = new "List"
    $P1578 = $P2
    $P1[$P1577] = $P1578
    $P1579 = $P1
    $P1 = new "Hash"
    new $P1580, "String"
    assign $P1580, "name"
    new $P1581, "String"
    assign $P1581, "$desc"
    $P1[$P1580] = $P1581
    new $P1582, "String"
    assign $P1582, "multi_invocant"
    new $P1583, 'Integer'
    set $P1583, 1
    $P1[$P1582] = $P1583
    new $P1584, "String"
    assign $P1584, "constraints"
    $P2 = new "List"
    $P1585 = $P2
    $P1[$P1584] = $P1585
    $P1586 = $P1
    $P1587 = $P1572."!create"($P1579, $P1586)
setprop block, "$!signature", $P1587
.end


.namespace []
.sub "_block1534"  :anon :subid("120") :outer("118")
    .local pmc outerlex
    getinterp $P0
    set outerlex, $P0["outer";"lexpad";1]
    set $P1536, outerlex["$_"]
    .lex "$_", $P1536
    set $P1537, outerlex["$/"]
    .lex "$/", $P1537
    set $P1538, outerlex["$!"]
    .lex "$!", $P1538
    new $P1539, "Perl6Str"
    assign $P1539, "not "
    "print"($P1539)
    get_global $P1543, "$num_of_tests_run"
    unless_null $P1543, vivify_221
    new $P1543, "Perl6Scalar"
  vivify_221:
    get_global $P1544, "$todo_upto_test_num"
    unless_null $P1544, vivify_222
    new $P1544, "Perl6Scalar"
  vivify_222:
    $P1542 = "infix:<="($P1543, $P1544)
  chain_end_223:
    unless $P1542, unless_1541
    set $P1540, $P1542
    goto unless_1541_end
  unless_1541:
    get_global $P1545, "$num_of_tests_failed"
    unless_null $P1545, vivify_224
    new $P1545, "Perl6Scalar"
    set_global "$num_of_tests_failed", $P1545
  vivify_224:
    get_global $P1546, "$num_of_tests_failed"
    unless_null $P1546, vivify_225
    new $P1546, "Perl6Scalar"
  vivify_225:
    new $P1547, "Int"
    assign $P1547, 1
    $P1548 = "infix:+"($P1546, $P1547)
    $P1549 = "infix:="($P1545, $P1548)
    set $P1540, $P1549
  unless_1541_end:
    .return ($P1540)
.end


.namespace []
.sub "_block1561"  :anon :subid("121") :outer("118")
    .local pmc outerlex
    getinterp $P0
    set outerlex, $P0["outer";"lexpad";1]
    set $P1563, outerlex["$_"]
    .lex "$_", $P1563
    set $P1564, outerlex["$/"]
    .lex "$/", $P1564
    set $P1565, outerlex["$!"]
    .lex "$!", $P1565
    get_global $P1566, "$todo_reason"
    unless_null $P1566, vivify_232
    new $P1566, "Perl6Scalar"
  vivify_232:
    $P1567 = "print"($P1566)
    .return ($P1567)
.end


.namespace []
.sub "_block1588"  :anon :subid("122") :outer("33")
    new $P1590, "Perl6Scalar"
    .lex "$_", $P1590
    new $P1591, "Perl6Scalar"
    .lex "$/", $P1591
    new $P1592, "Perl6Scalar"
    .lex "$!", $P1592
    get_global $P1593, "$testing_started"
    unless_null $P1593, vivify_233
    new $P1593, "Perl6Scalar"
  vivify_233:
    get_global $P1594, "$num_of_tests_planned"
    unless_null $P1594, vivify_234
    new $P1594, "Perl6Scalar"
  vivify_234:
    get_global $P1595, "$num_of_tests_run"
    unless_null $P1595, vivify_235
    new $P1595, "Perl6Scalar"
  vivify_235:
    get_global $P1596, "$num_of_tests_failed"
    unless_null $P1596, vivify_236
    new $P1596, "Perl6Scalar"
  vivify_236:
    get_global $P1600, "$testing_started"
    unless_null $P1600, vivify_237
    new $P1600, "Perl6Scalar"
  vivify_237:
    if $P1600, if_1599
    set $P1598, $P1600
    goto if_1599_end
  if_1599:
    get_global $P1602, "$num_of_tests_planned"
    unless_null $P1602, vivify_238
    new $P1602, "Perl6Scalar"
  vivify_238:
    get_global $P1603, "$num_of_tests_run"
    unless_null $P1603, vivify_239
    new $P1603, "Perl6Scalar"
  vivify_239:
    $P1601 = "infix:!="($P1602, $P1603)
  chain_end_240:
    set $P1598, $P1601
  if_1599_end:
    unless $P1598, if_1597_end
    .const 'Sub' $P1605 = "_block1604" 
    capture_lex $P1605
    $P1605()
  if_1597_end:
    get_global $P1623, "$testing_started"
    unless_null $P1623, vivify_243
    new $P1623, "Perl6Scalar"
  vivify_243:
    if $P1623, if_1622
    set $P1621, $P1623
    goto if_1622_end
  if_1622:
    get_global $P1624, "$num_of_tests_failed"
    unless_null $P1624, vivify_244
    new $P1624, "Perl6Scalar"
  vivify_244:
    set $P1621, $P1624
  if_1622_end:
    if $P1621, if_1620
    set $P1619, $P1621
    goto if_1620_end
  if_1620:
    .const 'Sub' $P1626 = "_block1625" 
    capture_lex $P1626
    $P1640 = $P1626()
    set $P1619, $P1640
  if_1620_end:
    .return ($P1619)
.end


.namespace []
.sub "_block1604"  :anon :subid("123") :outer("122")
    .local pmc outerlex
    getinterp $P0
    set outerlex, $P0["outer";"lexpad";1]
    set $P1606, outerlex["$_"]
    .lex "$_", $P1606
    set $P1607, outerlex["$/"]
    .lex "$/", $P1607
    set $P1608, outerlex["$!"]
    .lex "$!", $P1608
    new $P1609, "Perl6Str"
    assign $P1609, "Looks like you planned "
    get_global $P1610, "$num_of_tests_planned"
    unless_null $P1610, vivify_241
    new $P1610, "Perl6Scalar"
  vivify_241:
    $S1611 = "prefix:~"($P1610)
    concat $P1612, $P1609, $S1611
    new $P1613, "Perl6Str"
    assign $P1613, " tests, but ran "
    concat $P1614, $P1612, $P1613
    get_global $P1615, "$num_of_tests_run"
    unless_null $P1615, vivify_242
    new $P1615, "Perl6Scalar"
  vivify_242:
    $S1616 = "prefix:~"($P1615)
    concat $P1617, $P1614, $S1616
    $P1618 = "diag"($P1617)
    .return ($P1618)
.end


.namespace []
.sub "_block1625"  :anon :subid("124") :outer("122")
    .local pmc outerlex
    getinterp $P0
    set outerlex, $P0["outer";"lexpad";1]
    set $P1627, outerlex["$_"]
    .lex "$_", $P1627
    set $P1628, outerlex["$/"]
    .lex "$/", $P1628
    set $P1629, outerlex["$!"]
    .lex "$!", $P1629
    new $P1630, "Perl6Str"
    assign $P1630, "Looks like you failed "
    get_global $P1631, "$num_of_tests_failed"
    unless_null $P1631, vivify_245
    new $P1631, "Perl6Scalar"
  vivify_245:
    $S1632 = "prefix:~"($P1631)
    concat $P1633, $P1630, $S1632
    new $P1634, "Perl6Str"
    assign $P1634, " tests of "
    concat $P1635, $P1633, $P1634
    get_global $P1636, "$num_of_tests_run"
    unless_null $P1636, vivify_246
    new $P1636, "Perl6Scalar"
  vivify_246:
    $S1637 = "prefix:~"($P1636)
    concat $P1638, $P1635, $S1637
    $P1639 = "diag"($P1638)
    .return ($P1639)
.end


.namespace []
.sub "_block1641" :load :anon :subid("125") :outer("33")
$P0 = interpinfo .INTERPINFO_CURRENT_SUB
$P0 = $P0."get_outer"()
$P0()
    .return ()
.end


.namespace []
.sub "_block1643" :main :anon :subid("126") :outer("33")
    .param pmc param_1645
    .lex "args_str", param_1645
    "!SETUP_ARGS"(param_1645, 1)
$P0 = interpinfo .INTERPINFO_CURRENT_SUB
$P0 = $P0."get_outer"()
$P0()
    get_global $P1646, "MAIN"
    .local pmc main_sub
    set main_sub, $P1646
    isnull $I1649, main_sub
    unless $I1649, unless_1648
    new $P1647, 'Integer'
    set $P1647, $I1649
    goto unless_1648_end
  unless_1648:
    get_hll_global $P1650, "@ARGS"
    $P1651 = main_sub($P1650 :flat)
    set $P1647, $P1651
  unless_1648_end:
    .return ($P1647)
.end

