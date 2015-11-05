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
                         GBR       (GBR_)    #IMPLIED
                         HAN       (HAN_)    #IMPLIED
                         UK        (UK_)     #IMPLIED
                         AU        (AU_)     #IMPLIED
                         CN        (CN_)     #IMPLIED
                         CC       (CC_)    #IMPLIED
                         ASIA       (ASIA_)    #IMPLIED " >

<!-- 　　　　　　　　tableの選択を関係社に応じて使い分ける　　　　　　　　　 -->
<!ENTITY % tabletype-subs
                        "troubleshoot|flow" >

<!-- 　　　　　　　　olの選択を関係社に応じて使い分ける　　　　　　　　　 -->
<!ENTITY % ol-type-subs
                        "" >

<!-- 　　　　　　　　ulの選択を関係社に応じて使い分ける　　　　　　　　　 -->
<!ENTITY % ul-type-subs
                        "" >

<!-- 　　　　　　　　dlの選択を関係社に応じて使い分ける　　　　　　　　　 -->
<!ENTITY % dl-type-subs
                        "jobcode|jobtime|FIcover-introduction" >


<!-- 　　　　　　　　referの挙動を新旧のGeminiに応じて使い分ける　　　　　　　　　 -->
<!ENTITY % refer
                        "id        CDATA     #REQUIRED" >


<!-- 　　　　　　　　旧Gemini用にaタグ処理の挿入を追加する　　　　　　　　　 -->
<!ENTITY % a            "|a"                                          >
