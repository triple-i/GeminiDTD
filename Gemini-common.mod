<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % html         "html"                                       >


<!-- ============================================================= -->
<!--                   COMMON ATTLIST NAME ENTITIES                -->
<!-- ============================================================= -->
<!-- 　　　　　　DIVの仕向け選択を関係社に応じて使い分ける　　　　　　　　　 -->
<!ENTITY % div-destination
                        "JPN       (JPN_)    #IMPLIED
                         EXP       (EXP_)    #IMPLIED
                         CHN       (CHN_)    #IMPLIED
                         DEU       (DEU_)    #IMPLIED
                         ESP       (ESP_)    #IMPLIED
                         FRA       (FRA_)    #IMPLIED
                         ITA       (ITA_)    #IMPLIED
                         USA       (USA_)    #IMPLIED
                         TUR        (TUR_)     #IMPLIED
                         AUS       (AUS_)    #IMPLIED
                         RUS       (RUS_)    #IMPLIED
                         POL       (POL)    #IMPLIED
                         THA       (THA_)    #IMPLIED
                         NZL       (NZL_)    #IMPLIED
                         TWN       (TWN_)    #IMPLIED
                         IDN       (IDN_)    #IMPLIED
                         MYS       (MYS_)    #IMPLIED">


<!-- 　　　　　　　　tableの選択を関係社に応じて使い分ける　　　　　　　　　 -->
<!ENTITY % tabletype
                        "all|none|graph|parttable|complement|kitpart|kitnbr|list|img" >

<!-- 　　　　　　　　ulの選択を関係社に応じて使い分ける　　　　　　　　　 -->
<!ENTITY % ul-type
                        "bullet|none|asterisk|dash" >


<!-- 　　　　　　　　dlの選択を関係社に応じて使い分ける　　　　　　　　　 -->
<!ENTITY % dl-type
                        "warning|caution|danger|important|hint|information|annotation|note_caution|example|advice|memo|penalty" >


<!-- ============================================================= -->
<!--                COMMON ELEMENT/ATTLIST SETS                    -->
<!-- ============================================================= -->

<!ELEMENT html       (head, body) >

<!ELEMENT head       (meta) >

<!ELEMENT meta       EMPTY >
<!ATTLIST meta       folder    CDATA     #IMPLIED
                     section_id  CDATA     #IMPLIED
                     date      CDATA     #IMPLIED
                     lang      CDATA     #IMPLIED
                     destination  CDATA     #IMPLIED
                     revision  CDATA     #IMPLIED
                     bookid    CDATA     #IMPLIED
                     booktype  CDATA     #IMPLIED
                     modelname  CDATA     #IMPLIED
                     serialnbr  CDATA     #IMPLIED
                     book_id   CDATA     #IMPLIED
                     backcoverdate  CDATA     #IMPLIED >

<!ELEMENT body       (section) >

<!ELEMENT section    (group | newline)* >

<!ELEMENT group      ((div | title), (ol | ul | p | figure | table | dl | div | newline)*) >
<!ATTLIST group      introduction  (yes)     #IMPLIED
                     section_id  CDATA     #IMPLIED
                     sectionnumber  NMTOKENS  #IMPLIED >

<!ELEMENT newline    EMPTY >
<!ATTLIST newline    type      (page|all|column)  #IMPLIED >

<!ELEMENT title      (#PCDATA | img | cite | small | sup)* >
<!ATTLIST title      key       CDATA     #IMPLIED >

<!ELEMENT ol         (li, (li | div)*) >
<!--  <!ATTLIST ol         type (%ol-type-subs;)   #IMPLIED > -->

<!ELEMENT ul         (li, (li | div)*) >
<!ATTLIST ul         type      (%ul-type;)  #REQUIRED  >

<!ELEMENT li         ((div | p), (p | figure | table | ol | ul | dl | div)*) >

<!ELEMENT p          (#PCDATA | img | cite %a; | pmlink | b | small | sup | refer | frlink)* >
<!ATTLIST p          p_id      CDATA     #IMPLIED >

<!ELEMENT dl         (dt?, dd) >
<!ATTLIST dl         type      (%dl-type; | %dl-type-subs;)  #REQUIRED
                     OM_id     CDATA     #IMPLIED >

<!ELEMENT dt         (img | p)* >

<!ELEMENT dd         ((ol | ul | p), (ol | ul | p | figure | table)*) >

<!ELEMENT div        ((title, (ol | ul | p | figure | table | dl | div | left | newline)*) | (ol | ul | p | figure | table | dl | div | left | newline)+) >
<!ATTLIST div        span      (all)     #IMPLIED
                     %div-destination;
                     %div-destination-subs;>

<!ELEMENT left       (title | ol | ul | p | figure | table | dl | div | right)* >

<!ELEMENT right      (title | ol | ul | p | figure | table | dl | div)* >

<!ELEMENT table      (tabletitle?, thead?, tbody) >
<!ATTLIST table      cols      NMTOKEN   #REQUIRED
                     width     CDATA     #IMPLIED
                     format    NMTOKEN   #IMPLIED
                     tabletype  (%tabletype; | %tabletype-subs;)  #REQUIRED 
                     fontsize  (8)       #IMPLIED
                     align     (center | right)  #IMPLIED >
                     
<!ELEMENT tabletitle (#PCDATA | img | cite %a; | pmlink | b | small | sup | refer)* >

<!ELEMENT thead      (tr+) >

<!ELEMENT tbody      (tr+) >

<!ELEMENT tr         (td+) >

<!ELEMENT td         (p | ol | ul | dl)+ >
<!ATTLIST td         hspan     CDATA     #IMPLIED
                     vspan     CDATA     #IMPLIED
                     rbdr      NMTOKEN   #IMPLIED
                     cbdr      NMTOKEN   #IMPLIED
                     rotate    NMTOKEN   #IMPLIED >

<!ELEMENT figure     ((div | graphic)+, figuretitle?) >

<!ELEMENT figuretitle 
                     (p*) >

<!ELEMENT graphic    EMPTY >
<!ATTLIST graphic    file      CDATA     #IMPLIED
                     dpi       NMTOKEN   #IMPLIED
                     rasterdpi  NMTOKEN   #IMPLIED
                     alt       CDATA     #IMPLIED
                     impsize   CDATA     #IMPLIED
                     impby     (ref|copy)  #IMPLIED
                     sideways  NMTOKEN   #IMPLIED
                     impang    CDATA     #IMPLIED
                     xoffset   CDATA     #IMPLIED
                     yoffset   CDATA     #IMPLIED
                     position  NMTOKEN   #IMPLIED
                     align     NMTOKEN   #IMPLIED
                     cropped   NMTOKEN   #IMPLIED
                     float     NMTOKEN   #IMPLIED
                     width     CDATA     #IMPLIED
                     height    CDATA     #IMPLIED
                     angle     CDATA     #IMPLIED
                     bloffset  CDATA     #IMPLIED
                     nsoffset  CDATA     #IMPLIED
                     insetdata  CDATA     #IMPLIED >

<!ELEMENT img        EMPTY >
<!ATTLIST img        file      CDATA     #IMPLIED
                     dpi       NMTOKEN   #IMPLIED
                     rasterdpi  NMTOKEN   #IMPLIED
                     alt       CDATA     #IMPLIED
                     impsize   CDATA     #IMPLIED
                     impby     (ref|copy)  #IMPLIED
                     sideways  NMTOKEN   #IMPLIED
                     impang    CDATA     #IMPLIED
                     xoffset   CDATA     #IMPLIED
                     yoffset   CDATA     #IMPLIED
                     position  NMTOKEN   #IMPLIED
                     align     NMTOKEN   #IMPLIED
                     cropped   NMTOKEN   #IMPLIED
                     float     NMTOKEN   #IMPLIED
                     width     CDATA     #IMPLIED
                     height    CDATA     #IMPLIED
                     angle     CDATA     #IMPLIED
                     bloffset  CDATA     #IMPLIED
                     nsoffset  CDATA     #IMPLIED
                     insetdata  CDATA     #IMPLIED >

<!ELEMENT refer      EMPTY >
<!ATTLIST refer      id        CDATA     #REQUIRED
                     object    CDATA     #IMPLIED
                     format    (ref_text|page)  #REQUIRED >

<!ELEMENT b          (#PCDATA) >

<!ELEMENT pmlink     (#PCDATA) >

<!ELEMENT sup        (#PCDATA) >

<!ELEMENT small      (#PCDATA) >

<!ELEMENT cite       (#PCDATA %a; | sup | small | img | pmlink | refer)* >
<!ATTLIST cite       id        ID        #IMPLIED >

<!ELEMENT frlink     (#PCDATA) >
