<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!-- 　　　　　　　　旧Gemini用にaタグ処理の挿入を追加する　　　　　　　　　 -->
<!ENTITY % a-tag            "a"                                          >

<!-- ============================================================= -->
<!--                sub ELEMENT/ATTLIST SETS                       -->
<!-- ============================================================= -->

<!-- aタグはBARONESSのみ -->
<!ELEMENT a          EMPTY >
<!ATTLIST a          id        IDREFS    #IMPLIED
                     format    CDATA     #IMPLIED
                     srcfile   CDATA     #IMPLIED >