library(shiny)
library(shinyMobile)

## UI


##### PAGE ####
ui <- f7Page(
  title = "DaBlaCa",
  
  #### TABLAYOUT ####
  f7TabLayout(
    navbar = "",
    
    #### TABS ####
    f7Tabs(
      id = "tabs",
      style = "segmented",
      animated = FALSE,
      swipeable = TRUE,
      #### TAB #1 ####
      f7Tab(
        tabName = "Udredning af blæretumorer",
        icon = f7Icon("search_circle", old = FALSE),
        active = TRUE,
        
        #### ANMELDELSE ####
        f7Accordion(
          f7AccordionItem(
            title = tags$b("Anmeldelsespligt"),
            tags$hr(),
            f7Block("Tumorer udgående fra blæren er anmeldelsespligtige til Cancerregistret. (D)", strong = T, hairlines = F),
            f7Block("Erhvervsmæssig sammenhæng med blæretumorer er anmeldelsespligtig til Arbejdsmarkedets Erhvervssikring (www.aes.dk). (D)", strong = T, hairlines = F)
          )
        ),
        f7Accordion(
          f7AccordionItem(
            title = tags$b("Tumorbeskrivelse og T-stadie"),
            f7Block("Tumors udbredelse/dybdevækst klassificeres i henhold til 8. udgave af TNM klassifikationen fra Union International Contre le Cancer (UICC) fra 2016, dog bør stadie T1 tumorer subklassificeres i T1a og T1b (D)", strong = TRUE),
            f7Block(tags$h4("Klassifikation og malignitetsgrad"), "Blæretumorer inddeles i hht. WHOs klassifikation. Således anføres den morfologiske variant af tumor ligesom der angives en malignitetsgrad. (D)", strong = TRUE, hairlines = FALSE),
            tags$hr(),
            f7Block(tags$br(), tags$em("Ovenstående vedr. T-stadie og klassifikation fremgår også af den danske kodevejledning: http://www.patobank.dk/fundanemt/files/snomed/vejledninger/B._Blaerecancer.pdf")),
            tags$br(), tags$br(),
          )
        ),
        
        #### UDREDNING OG PAKKE ####
        f7Accordion(
          wellPanel(
            id = "udredningogpakke", style = "overflow-y:scroll; max-height: 500px",
            f7AccordionItem(
              title = tags$b("Udredningsforløb og pakkeforløb"),
              f7Block("Patienter henvist med makroskopisk eller mikroskopisk hæmaturi, hvor der findes normale forhold ved CT-urografi og cystoskopi kan afsluttes mht. kræftmistanken. (C)", strong = TRUE),
              f7Block("Skal evt. yderligere symptomudredes", strong = TRUE),
              f7Block("Anbefales fornyede undersøgelser, hvis der senere optræder symptomer fra urinvejene eller fornyet makroskopisk hæmaturi.", strong = TRUE),
              f7Block("Asymptomatisk mikroskopisk hæmaturi udredes ikke. (B)", strong = TRUE),
              f7Block("Patienter skal henvises til udredning i pakkeforløb ved mindst et af nedenstående kriterier, der giver begrundet mistanke om kræft: (B)", tags$br(), "(Efter Sundhedsstyrelsens ”Pakkeforløb for kræft i blære og i nyrer”)", strong = TRUE, hairlines = FALSE),
              f7Block("• Patienter med synligt blod i urinen uden anden åbenbar årsag*", strong = TRUE, inset = TRUE),
              f7Block("• Ikke synligt blod i urinen hos patienter over 60 år fundet ved udredning af symptomer i form af smerter i blæreregionen og/eller irritative vandladningsgener eller flankesmerter og/eller palpabel udfyldning", strong = TRUE, inset = TRUE),
              f7Block("• Patienter med billeddiagnostisk mistanke om tumor i nyre, nyrebækken, urinleder eller blære ved undersøgelse udført på radiologisk afdeling (Se nedenstående afsnit)", strong = TRUE, inset = TRUE),
              f7Block("• Patienter med tidligere tumor i blæren, urinleder eller nyrebækken, der som del af opfølgningsregime med skopi eller billeddiagnostik får påvist ny tumor i blæren, nyrebækken eller urinleder.", strong = TRUE, inset = TRUE),
              f7Block("• Patienter, der følges i et fast opfølgningsprogram i henhold til de landsdækkende kliniske retningslinjer på grund af tidligere ikke-invasiv blærekræft (Ta-tumorer), skal ikke henvises til nyt pakkeforløb.", strong = TRUE, inset = TRUE), tags$br(), tags$br(),
              f7Block(tags$em("*Anden åbenbar årsag kan f.eks. være dysreguleret antikoagulansbehandling, 1. gangs dyrkningsverificeret urinvejsbetændelse og hæmaturi efter urinretention."), tags$br(), tags$br(), tags$em("Hele kræftpakkedokumentet kan downloades fra sundhedsstyrelsen på Sundhedsstyrelsens hjemmeside"), tags$br(), tags$br())
            )
          )
        ),
        
        #### BILLEDIAGNOSTIK ####
        f7Accordion(
          wellPanel(
            id = "billeddiagnostik", style = "overflow-y:scroll; max-height: 300px",
            f7AccordionItem(
              title = tags$b("Billeddiagnostik"),
              tags$hr(),
              f7Block("CT-urografi bør foretages hos patienter hvor der mistænkes nyre- eller urinvejscancer. (B)", strong = TRUE, hairlines = FALSE),
              f7Block("MR-urografi eller MR-hydrografi suppleret med diffusionsvægtet MR af nyrer (og evt. urinveje) kan være et alternativ hvis CT-urografi ikke kan gennemførest. (B)", strong = TRUE, hairlines = FALSE),
              tags$hr(),
              f7Block(tags$h4("Stadieinddeling af urinvejscancer"), "Hvor radikal behandling overvejes bør patienten få foretaget FPG-PET/CT-scanning af thorax og abdomen med henblik på metastaser. (B)", strong = TRUE, hairlines = FALSE),
              f7Block("Fund ved FDG-PET/CT-scanning af thorax, som ikke kan klassificeres yderligere på grund af ringe
størrelse bør ikke have opsættende virkning på en eventuel behandling, men bør kontrolleres ved
de opfølgende undersøgelser af patienten efter kirurgi. (D)", strong = TRUE, hairlines = FALSE),
              f7Block("Stadieinddelingen bør ikke være mere end fire uger gammel ved behandlingsstart. (D)", strong = TRUE, hairlines = FALSE),
              tags$hr(),
              f7Block(tags$h4("Opfølgning efter cystektomi"), "CT-scanning af thorax og abdomen anbefales. (B)", strong = TRUE, hairlines = FALSE)
            )
          )
        ),
        
        #### CYSTOSKOPI. TUR-B & URINCYT ####
        f7Accordion(
          wellPanel(
            id = "cystoskopiturbogurincyt", style = "overflow-y:scroll; max-height: 420px",
            f7AccordionItem(
              title = tags$b("Cystoskopi, TUR-B og Cytologi"),
              f7Block("Tumor beskrives mht: Antal, Størrelse, Karakteristika (papillifære, solide, ulcerende eller nekrotiske), Øvrige slimhinde i blære og urethra beskrives. (B)", strong = TRUE),
              f7Block("Slimhinden i forvæggen ned mod blærehalsen kan være vanskelig at overskue, eventuelt skiftes til 30 eller 70 graders optik under TUR-B. (D)", strong = TRUE),
              f7Block("Der laves altid bimanuel palpation ved TUR-B til vurdering af klinisk tumorstadie og forhold i
bækkenet mhp evt klinisk T4b tumor. (D)", strong = TRUE),
              f7Block("Der laves komplet tumorresektion hvis tumor skønnes ikke-invasiv. (D)", strong = TRUE),
              f7Block("Den primære resektion bør indeholde detrusor muskel med mindre det klinisk drejer sig om en
mindre tumor af lav malignitetsgrad. (B)", strong = TRUE),
              f7Block("Ved oplagt malign tumor, hvor radikal tumorresektion ikke skønnes mulig, kan spånbiopsier til
bekræftelse af histologisk diagnose være tilstrækkelig. (D)", strong = TRUE),
              f7Block("Fluorecensguidet cystoskopi (PDD) og Narrow Band Imaging (NBI) påviser flere CIS forandringer og
giver en mere komplet tumorresektion sammenlignet med hvidt lys. (B)", strong = TRUE),
              f7Block("Ved primær resektion tages enten PDD guidede, NBI guidede eller selected site biopsier. (B)", tags$br("Indikationer for PDD eller NBI: (B)"), strong = TRUE, hairlines = F),
              f7Block("• Førstegangs blæretumor mhp komplet resektion og som alternativ til selected site biopsier
mhp påvisning af CIS", strong = TRUE, inset = TRUE),
              f7Block("• Første kontrol efter BCG pga. CIS", strong = TRUE, inset = TRUE),
              f7Block("• High grade/malignitetssuspekte celler i urinen ved normale fund ved cystoskopi og CT-urografi", strong = TRUE, inset = TRUE),
              f7Block("Urincytologi anbefales til kontrol ved højrisiko tumorer og CIS. (A)", strong = TRUE, hairlines = TRUE),
              f7Block("Perioperativ instillation af mitomycin C bør tilbydes patienter med lav risiko tumorer, hvor
kriterierne nedenfor ikke er tilstede. (A)", strong = TRUE),
              f7Block("Perioperativ Mitomycin C skylning bør IKKE anvendes ved følgende: (A)", strong = TRUE, hairlines = FALSE),
              f7Block("• mere end 7 primære tumorer.", strong = TRUE, inset = TRUE),
              f7Block("• mere en én primær tumor hvis mindst én er >3 cm", strong = TRUE, inset = TRUE),
              f7Block("• mere en én recidivtumor", strong = TRUE, inset = TRUE),
              f7Block("• under 1 år siden sidste recidiv", strong = TRUE, inset = TRUE), tags$br(), tags$br(),
            )
          )
        )
      ),
      
      #### TAB #2 ####
      f7Tab(
        tabName = "Behandling og opfølgning",
        icon = f7Icon("bandage_fill", old = FALSE),
        active = FALSE,
        
        #### PULMP ####B
        f7Accordion(
          f7AccordionItem(
            title = tags$b("Benignt urotelialt papillom og inverteret urotelialt papillom"),
            f7Block("Hvis resterende tumor ikke mistænkes, er der ikke anledning til opfølgning. Det anbefales, at man
udelukkende anvender diagnoserne ved de klassiske tilfælde. (D)", strong = TRUE)
          )
        ),
        
        #### pTa ####
        f7Accordion(
          wellPanel(
            id = "ptatumorer", style = "overflow-y:scroll; max-height: 600px",
            f7AccordionItem(
              title = tags$b("Ta Tumorer"),
              tags$hr(),
              f7Block("Efter TUR-B, og når histologien kendes, placeres tumor som enten lav-, mellem- eller højrisiko
tumor. Yderligere behandling og opfølgning af patienten skal foregå i henhold til denne inddeling.
(A)", strong = TRUE, hairlines = FALSE),
              tags$hr(),
              f7Block(tags$b("Lav risiko tumorer"), tags$em("(førstegangs (primær) solitær, mindre end 3 cm stor, low grade Ta/PUNLMP tumor)"), strong = TRUE, hairlines = FALSE),
              f7Block("Der er ikke indikation for adjuverende skyllebehandling fraset evt. allerede administreret
perioperativ Mitomycin C. (A)", strong = TRUE, hairlines = FALSE),
              f7Block("Følges op efter 4-8-12 modellen. Kan afsluttes efter 5 års recidivfrihed. (B)", strong = TRUE, hairlines = FALSE),
              tags$hr(),
              f7Block(tags$b("Mellemrisiko tumorer"), tags$em("(Multiple eller recidiverende low grade Ta tumorer, solitære Ta high grade
tumorer under 3 cm og primære Ta low grade tumorer over 3 cm)"), strong = TRUE, hairlines = FALSE),
              f7Block("Efter TUR-B skal man overveje adjuverende skyllebehandling (Mitomycin C ved low grade tumorer
og BCG ved high grade tumorer). (A)", strong = TRUE, hairlines = FALSE),
              f7Block("Mitomycin C bør ikke gives ved: (D)", strong = TRUE, hairlines = FALSE),
              f7Block("• ved makroskopisk hæmaturi", strong = TRUE, inset = TRUE),
              f7Block("• efter traumatisk kateterisation", strong = TRUE, inset = TRUE),
              f7Block("• ved symptomatisk urinvejsinfektion", strong = TRUE, inset = TRUE),
              f7Block("Følges op efter 4-8-12 modellen. Opfølgningen er som udgangspunkt livslang, men udvalgte
patienter kan afsluttes efter 5 års recidivfrihed. (B)", strong = TRUE, hairlines = FALSE),
              tags$hr(),
              f7Block(tags$b("Højrisiko tumorer"), tags$em("(multiple/recidiverende Ta high grade tumorer, Ta high grade tumorer over 3 cm)"), strong = TRUE, hairlines = FALSE),
              f7Block("Der skal kun foretages re-resektion ved mistanke om inkomplet primær resektion. [D]", strong = TRUE, hairlines = FALSE),
              f7Block("Patienter med højrisiko tumorer bør tilbydes adjuverende BCG skylninger som kan suppleres med
evt vedligehold i 1-3 år. (A)", strong = TRUE, hairlines = FALSE),
              f7Block("Opfølgning af patienter med højrisiko tumorer bør være hver 4 måned i 2 år, som kan tilpasses
tidspunkt for evt. vedligeholds BCG. Herefter bruges 4-8-12 modellen. Opfølgningen bør fortsætte
livslangt. (B)", strong = TRUE, hairlines = FALSE),
              f7Block("Opfølgning af patienter med højrisiko tumorer bør være hver 4 måned i 2 år, som kan tilpasses
tidspunkt for evt. vedligeholds BCG. Herefter bruges 4-8-12 modellen. Opfølgningen bør fortsætte
livslangt. (B)", strong = TRUE, hairlines = FALSE),
              f7Block("BCG bør ikke gives: (D)", strong = TRUE, hairlines = FALSE),
              f7Block("• de første 2 uger efter TUR-B", strong = TRUE, inset = TRUE),
              f7Block("• ved makroskopisk hæmaturi", strong = TRUE, inset = TRUE),
              f7Block("• efter traumatisk kateterisation", strong = TRUE, inset = TRUE),
              f7Block("• ved symptomatisk urinvejsinfektion", strong = TRUE, inset = TRUE),
              f7Block("• til immunkompromitterede patienter (konfereres med relevant specialafdeling)", strong = TRUE, inset = TRUE),
              f7Block("• til patienter med aktiv TB", strong = TRUE, inset = TRUE)
            )
          )
        ),
        f7Accordion(
          wellPanel(
            id = "fladelæsioner", style = "overflow-y:scroll; max-height: 600px",
            f7AccordionItem(
              title = tags$b("Flade læsioner"),
              tags$hr(),
              f7Block(tags$b("Metaplasi"), strong = TRUE, hairlines = FALSE),
              f7Block("Spredte foci giver ikke anledning til opfølgning. (D) ", strong = TRUE, hairlines = FALSE),
              f7Block("Patienter med keratiniserende planocellulær metaplasi eller meget udbredt metaplasi bør følges livslangt med årlig cystoskopi. (D)", strong = TRUE, hairlines = FALSE),
              tags$hr(),
              f7Block(tags$b("Dysplasi"), strong = TRUE, hairlines = FALSE),
              f7Block("Ved fladeformet dysplasi som eneste fund bør patienterne følges som patienter med low grade
tumorer. (D)", strong = TRUE, hairlines = FALSE),
              tags$hr(),
              f7Block(tags$b("CIS - carcinoma in situ"), strong = T, hairlines = F),
              f7Block("Behandles med BCG skylninger incl. vedligehold. (A)", strong = T, hairlines = F),
              f7Block("Første cystoskopikontrol efter BCG induktion bør udføres med PDD- eller NBI-guidede biopsier af
suspekte områder samt selected site biopsier. (B)", strong = T, hairlines = F),
              f7Block("Ved fortsat CIS efter første induktionskur, bør overvejes ny induktionskur. (D)", strong = T, hairlines = F),
              f7Block("Kontrolleres forud for hver vedligeholdsbehandling med flexcystoskopi. Herefter hver 4. måned
indtil 2 år efter induktionsbehandling. Herefter årlig kontrol. Kontrollen bør fortsætte livslangt. (D)", strong = T, hairlines = F),
              f7Block("Ved manglende effekt af skyllebehandling på CIS eller ved tegn på progression må der på vide
indikationer foretages evaluering med henblik på cystektomi. (A)", strong = T, hairlines = F),
              f7Block("Urincytologi skal benyttes til kontrol af CIS. (B)", strong = T, hairlines = F)
            )
          )
        ),
        f7Accordion(
          wellPanel(
            id = "t1", style = "overflow-y:scroll;max-height: 450px",
            f7AccordionItem(
              title = tags$b("T1 tumorer"),
              f7Block("Patienter med T1 tumorer (invasiv vækst) skal konfereres med eller henvises til et cystektomerende
center. (B)", strong = T, hairlines = T),
              f7Block("Cystektomi bør overvejes ved én eller flere af følgende: (B)", strong = T, hairlines = F),
              f7Block("• Dyb invasion i lamina propria (T1b)", strong = TRUE, inset = TRUE),
              f7Block("• Invasion i lymfe- eller blodkar", strong = TRUE, inset = TRUE),
              f7Block("• Stor primærtumor (>3 cm)", strong = TRUE, inset = TRUE),
              f7Block("• Multifokal T1a", strong = TRUE, inset = TRUE),
              f7Block("• T1a med særlig aggressiv histologisk subtype", strong = TRUE, inset = TRUE),
              f7Block("• Samtidig CIS i blæreslimhinden", strong = TRUE, inset = TRUE),
              f7Block("• Recidiv af tidligere radikalt reseceret invasiv tumor", strong = TRUE, inset = TRUE),
              f7Block("• Hvis tumor er lokaliseret nedadtil på blærens forvæg, hvor resektion er vanskelig", strong = TRUE, inset = TRUE),
              f7Block("• Hvis der er billeddiagnostisk mistanke om mere avanceret tumor. (D)", strong = TRUE, inset = TRUE),
              f7Block("• Hvis der er palpabel tumor efter endoskopisk resektion. (D)", strong = TRUE, inset = TRUE),
              f7Block("Hvis cystektomi ikke udføres bør der foretages re-resektion for at sikre fuldstændig resektion og
minimere risikoen for understaging. (C)", strong = TRUE, hairlines = T),
              f7Block("T1a tumorer der ikke opfylder de i punkt 2 nævnte faktorer kan behandles konservativt med TUR-B,
re-resektion og BCG installationer i vedligeholdelsesregi. (B)", strong = T, hairlines = T),
              f7Block("Patienter med T1a tumorer, der ikke cystektomeres, undersøges med cystoskopi og urincytologi
hver 4. måned i 2 år, herefter livslang årlig kontrol. (D)", strong = T, hairlines = T),
              f7Block("Hos patienter med initielt konservativt behandlet T1a tumorer, bør der foretages umiddelbart
evaluering med henblik på cystektomi, hvis der opstår recidiv eller tegn på progression. (B)", strong = TRUE, hairlines = T),
              tags$br(), tags$br(),
            )
          )
        ),
        f7Accordion(
          wellPanel(
            id = "mibc", style = "overflow-y:scroll; max-height: 400px",
            f7AccordionItem(
              title = tags$b("Muskelinvasiv blærekræft"),
              tags$hr(),
              f7Block(tags$b("Neoadjuverende behandling"), strong = T, hairlines = F),
              f7Block("Præoperativ neoadjuverende kemoterapi tilbydes egnede patienter (alder < 75 år, PS 0-1, normal nyrefunktion). (A)", strong = T, hairlines = F),
              f7Block("Patienter med småcellede karcinomer skal tilbydes kemoterapi inden eventuel cystektomi. (D)", strong = T, hairlines = F),
              f7Block("Rutinemæssig anvendelse af adjuverende kemoterapi anbefales ikke. (B)", strong = T, hairlines = F),
              tags$hr(),
              f7Block(tags$b("Cystektomi")),
              f7Block("Radikal cystektomi evt. forudgået af neoadjuverende kemoterapi er førstevalgsbehandling hos patienter med muskelinvasiv blærekræft (T2-T4a, N0-1, M0). (B)", strong = T, hairlines = F),
              f7Block("Der foretages lymfeknude exairese fra aorta bifurcaturen til symfysen. (B)", strong = T, hairlines = F),
              f7Block("Indgrebet kan udføres åbent eller robot-assisteret. (A)", strong = T, hairlines = F),
              f7Block("Nervebesparende/vaginalbesparende indgreb kan udføres hos selekterede patinter mhp at bevare seksuel funktion. (B)", strong = T, hairlines = F),
              f7Block("Partiel cystektomi kan overvejes ved urachus tumor. (B)", strong = T, hairlines = F),
              tags$hr(),
              f7Block(tags$b("Urinafledning i forbindelse med cystektomi"), strong = T, hairlines = F),
              f7Block("Der kan anlægges følgende urinafledninger: (C)", strong = T, hairlines = F),
              f7Block("• Urostomi (Bricker-afledning/conduite)", strong = T, inset = T),
              f7Block("• Neoblære: Ileum-blære anastomoseret til urethra. Tømmes med bugpressen eller ren intermitterende selv-kateterisation (RIK)", strong = T, inset = T),
              f7Block("• Pouch: Tildannet tarmblære med kontinent tømmekanal. Tømmes ved RIK", strong = T, inset = T),
              f7Block("• Uretero-cutaneostomi: Sjældent anvendt, primært hos ældre én-nyrede patienter", strong = T, inset = T),
              tags$hr(),
              f7Block(tags$b("Opfølgning efter cystektomi med urinafledning"), strong = T, hairlines = F),
              f7Block("Alle patienter undersøges efter ca. 4 mdr., 12 mdr. og 24 mdr. med CT-scanning af thorax og abdomen. (D)", strong = T, hairlines = F),
              f7Block("Patienter med udbredt CIS i den fjernede blære eller CIS i ureter undersøges efter 4 mdr., 12 mdr., 24 mdr. og 36 mdr. med CT-scanning af thorax og abdomen og desuden med udskillelses-fase eller tilsvarende ved alle CT-scanninger. (D)", strong = T, hairlines = F),
              f7Block("Højrisiko patienter (pT3N0 el. pTxN1-3) samt patienter med småcellet karcinom undersøges med yderligere to CT-scanninger af thorax og abdomen inden for de første 2 år, eksempelvis efter 8 mdr. og 18 mdr. (D)", strong = T, hairlines = F),
              f7Block("Årlig blodprøveopfølgning livslangt med hæmoglobin, se-creatinin, standard bicarbonat og cobalamin (B12) af cystektomerede patienter anbefales. (D)", strong = T, hairlines = F),
              tags$hr(),
              f7Block(tags$b("Kurativt intenderet strålebehandling"), strong = T, hairlines = F),
              f7Block("Strålebehandling kan tilbydes til patienter med T2 til T4a-tumorer med N0-N1, og uden tegn på fjernmetastaser (M0) med PS 0-2. Patienter skal klinisk og billeddiagnostisk udredes som patienter til cystektomi. (C)", strong = T, hairlines = F),
              f7Block("Til patienter i god almentilstand (performancestatus 0-1, under 75 år i biologisk alder) kan konkomitant kemoterapi med mitomycin og 5-floururacil overvejes. (A)", strong = T, hairlines = F),
              f7Block("Der gives typisk i alt 30-32 behandlinger af 2 Gy med 5 behandlinger om ugen dvs. en samlet behandlingstid på minimum 6 uger. (C)", strong = T, hairlines = F),
              f7Block("Opfølgning efter radikal strålebehandling inkluderer cystoskopi (efter 3 mdr. (med biopsi) og herefter hver 4. md. og efter 2 år årligt) og CT scanning (efter 4, 12 og 24 mdr). (D)", strong = T, hairlines = F),
              f7Block("TMT (Trimodal terapi med maksimal TUR-B, kemobehandling/ radiosensitizer samt ekstern strålebehandling), kan tilbydes selekterede patienter. (C)", strong = T, hairlines = F)
            )
          )
        ),
        f7Accordion(
          f7AccordionItem(
            title = tags$b("Hvis radikal behandling ikke er mulig"),
            tags$hr(),
            f7Block("Lokal behandling med TUR-B anbefales kun til patienter, der pga. co-morbiditet skønnes uegnet til mere radikal, kurativ intenderet behandling. (D)", strong = T, hairlines = F),
            f7Block("Systemisk kemoterapi uden efterfølgende cystektomi eller strålebehandling anbefales ikke ved formodet lokaliseret sygdom. (B)", strong = T, hairlines = F)
          )
        ),
        f7Accordion(
          wellPanel(id = "metastaser", style = "overflow-y:scroll; max-height: 400px",
                    f7AccordionItem(
                      title = tags$b("T4b og metastatisk blærekræft"),
                      tags$hr(),
                      f7Block("Patienter med T4b tumorer og patienter med regionære lymfeknudemetastaser og/eller fjernmetastaser bør primært tilbydes systemisk onkologisk behandling hvis tilstanden tillader det. (D)", strong = T, hairlines = F),
                      f7Block("Patienter uden organmetastaser på diagnosetidspunktet, som efter onkologisk behandling er i billeddiagnostisk komplet respons, kan evt. tilbydes konsoliderende lokal behandling (cystektomi eller strålebehandling). (D)", strong = T, hairlines = F),
                      tags$hr(),
                      f7Block(tags$b("Palliativ strålebehandling")),
                      f7Block("Anbefalet dosis og teknik ved pallierende strålebehandling: (D)", strong = T, hairlines = F),
                      f7Block("• CTV (clinical target volume) = blære + tumor", strong = T, inset = T),
                      f7Block("PTV (planning target volume) = CTV + 1cm eller CTV + 1,5 cm til feltgrænsen", strong = T, hairlines = F),
                      f7Block("• Dosis: Typisk 30 Gy på 10 fraktioner, 5 fraktioner per uge.", strong = T, inset = T),
                      f7Block("Skrøbelige patienter kan evt behandles med færre fraktioner.",strong = T, hairlines = F),
                      tags$hr(),
                      f7Block(tags$b("Systemisk onkologisk behandling"), strong = T, hairlines = F),
                      f7Block("Systemisk onkologisk behandling er det primære behandlingstilbud til patienter med primært lokalavanceret, inoperabel (T4b-tumorer, N2-N3) eller metastatisk (M+) urotelialt karcinom samt til patienter med recidiv efter tidligere cystektomi eller inoperabelt recidiv efter strålebehandling. (B)", strong = T, hairlines = F),
                      f7Block("Systemisk onkologisk behandling er kontraindiceret hos patienter, som opfylder ét af følgende: (D)", strong = T, hairlines = F),
                      f7Block("• Betydeligt nedsat performance status (>2)", strong = T, inset = T),
                      f7Block("• Aktiv infektion som kræver i.v. antibiotika", strong = T, inset = T),
                      f7Block("• Klinisk betydende trombo-emboliske tilstande", strong = T, inset = T),
                      f7Block("• Andre alvorlige påvirkninger af patientens tilstand", strong = T, inset = T),
                      tags$hr(),
                      f7Block(tags$b("Opfølgning efter systemisk onkologisk behandling"), strong = T, hairlines = F),
                      f7Block("Undersøgelser hos patienter efter behandling for metastastisk sygdom afhænger af sygdomsstatus og almentilstand. (D)", strong = T, hairlines = F),
                      f7Block("• Patienter i performancestatus >2 skal ikke følges op, men tilbydes pallierende og understøttende foranstaltninger.", strong = T, inset = T),
                      f7Block("• Patienter i performance 0-2 med respons efter kemoterapi, hvor man ved sygdomsprogression kan tilbyde evt. 2. linie behandling, skal følges regelmæssigt.", strong = T, inset = T),
                      f7Block("Opfølgningen består i CT-scanning af thorax-abdomen og bækken hver 4. måned i 2 år herefter hver 6. måned i yderligere 3 år, så længe patienten er kandidat til 2. linje behandling. (D)", strong = T, hairlines = F),
                      f7Block("Patienter med komplet respons på kemoterapi, som ikke er cystektomerede, skal kontrolleres med cystoskopi svarende til kontrol efter strålebehandling, hvilket vil sige cystoskopikontrol hver 4. måned i 2 år. Herefter årlig kontrol. (D)", strong = T, hairlines = F)
                    )
          )
          
        )
        
      ),
      #### TAB #3 ####
      f7Tab(
        tabName = "Om",
        icon = f7Icon("info_circle", old = TRUE),
        active = FALSE,
        f7Block("Dette er en app-udgave af Pixi-versionen af", tags$em("'Anbefalinger fra Nationale kliniske retningslinjer for behandling af blæretumorer i Danmark'."), tags$br(), tags$br(),
                "De udgives på vegne af DaBlaCa-styregruppen", tags$br(), tags$br(),
                "De fulde retningslinjer kan findes her:", tags$br(), f7Link(label = "DaBlaCa retningslinjer for behandling af blæretumorer i Danmark", icon = NULL, src = "http://www.skejby.net/DaBlaCa-web/DaBlaCaWEB.htm", external = TRUE)
        )
      )
    )
  )
)



#### SERVER ####
server <- function(input, output) {}


#### APP CALL #####
shinyApp(ui = ui, server = server)
