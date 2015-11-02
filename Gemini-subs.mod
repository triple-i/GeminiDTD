<!ENTITY % html PUBLIC "-//GeminiDTD" "Gemini-subs.mod"                                                       >
%a;

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % a             "a"                                         >

<!ENTITY % refer         "refer"                                     >

<!-- ============================================================= -->
<!--                sub ELEMENT/ATTLIST SETS                    -->
<!-- ============================================================= -->

<!-- aタグはBARONESSのみ -->
<!ELEMENT a          EMPTY >
<!ATTLIST a          id        IDREFS    #IMPLIED
                     format    CDATA     #IMPLIED
                     srcfile   CDATA     #IMPLIED >


<!-- BARONESS -->
<!ELEMENT refer      (#PCDATA) >
<!ATTLIST refer      id        CDATA     #IMPLIED
                     object    CDATA     #IMPLIED
                     format    CDATA     #IMPLIED >