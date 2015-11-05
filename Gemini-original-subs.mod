<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                sub ELEMENT/ATTLIST SETS                       -->
<!-- ============================================================= -->

<!-- 　　　　　　DIVの仕向け選択を関係社に応じて使い分ける　　　　　　　　　 -->
<!ENTITY % div-destination-subs
                        "CE        (CE_)     #IMPLIED
                         EU        (EU_)     #IMPLIED
                         LX        (LX_)     #IMPLIED
                         NA        (NA_)     #IMPLIED
                         HAN       (HAN_)    #IMPLIED
                         AU        (AU_)     #IMPLIED
                         CC       (CC_)    #IMPLIED
                         ASIA       (ASIA_)    #IMPLIED " >

<!-- 　　　　　　　　tableの選択を関係社に応じて使い分ける　　　　　　　　　 -->
<!ENTITY % tabletype-subs
                        "" >

<!-- 　　　　　　　　olの選択を関係社に応じて使い分ける　　　　　　　　　 -->
<!ENTITY % ol-type-subs
                        "" >

<!-- 　　　　　　　　ulの選択を関係社に応じて使い分ける　　　　　　　　　 -->
<!ENTITY % ul-type-subs
                        "" >

<!-- 　　　　　　　　dlの選択を関係社に応じて使い分ける　　　　　　　　　 -->
<!ENTITY % dl-type-subs
                        "|jobcode|jobtime|FIcover-introduction" >


<!-- 　　　　　　　　旧Gemini用にaタグ処理の挿入を追加する　　　　　　　　　 -->
<!ENTITY % a            ""                                          >
