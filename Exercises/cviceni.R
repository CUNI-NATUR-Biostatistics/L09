#----------------------------------------------------------#
#
#          L09 — Porovnání kandidátních modelů
#                 Praktické cvičení v R
#             Studenti biologie a ekologie
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

#----------------------------------------------------------#
# Příprava -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Jak získat a otevřít soubory -----
#--------------------------------------------------#
# Ke cvičení potřebujete dva soubory: tento skript cviceni.R a datový
# soubor allometrie_stromu.csv.
#
# Kde soubory najdete:
# V README lekce (soubor README.md vedle složky Exercises) najděte část
# Materiály pro studenty a otevřete odkazy Skript ke cvičení a CSV dat.
# Pokud se soubor otevře na GitHubu, stáhněte ho tlačítkem Download raw
# file nad obsahem souboru. Neukládejte stránku prohlížeče jako HTML.
# Po vydání cvičení budou oba soubory také na webu kurzu:
# https://cuni-natur-biostatistics.github.io/L09/current/code/cviceni.R
# https://cuni-natur-biostatistics.github.io/L09/current/data/allometrie_stromu.csv
#
# Jak soubory uložit:
# 1. Vytvořte složku L09_praktikum a v ní podsložku data.
# 2. Soubor cviceni.R uložte do složky L09_praktikum.
# 3. Soubor allometrie_stromu.csv uložte do podsložky data. Jeho jméno
#    neměňte.
#
# Jak otevřít projekt v RStudiu:
# RStudio Project je obyčejná složka, ve které pracujete. RStudio do ní
# přidá soubor .Rproj, pomocí kterého složku příště snadno znovu otevřete.
# Skript, data i výstupy zůstávají samostatnými soubory uvnitř složky.
# 1. V RStudiu zvolte File > New Project > Existing Directory.
# 2. Vyberte složku L09_praktikum a potvrďte Create Project.
# 3. V panelu Files otevřete cviceni.R.
# 4. Přes File > Save As si uložte vlastní kopii, například
#    cviceni_L09_prijmeni.R.

#--------------------------------------------------#
## Jak se skriptem pracovat -----
#--------------------------------------------------#
# Hlavní úlohy U01–U08 řešte v uvedeném pořadí, protože na sebe navazují.
# Úlohy navíc N01–N20 jsou dobrovolné. Slouží k dalšímu procvičování,
# klidně i po praktiku, a nemusíte je stihnout.
#
# Spouštění kódu:
# - Jeden příkaz spustíte tak, že do něj umístíte kurzor a stisknete
#   Ctrl + Enter.
# - Více příkazů najednou označte myší a stiskněte Ctrl + Enter.
# - Výsledky se vypisují v panelu Console, grafy v panelu Plots a vytvořené
#   objekty uvidíte v panelu Environment.
#
# Komentáře a odpovědi:
# - Řádky začínající znakem # jsou komentáře; R je nespouští.
# - Kód pište pod řádek "Vaše řešení". Slovní odpovědi pište jako komentáře.
# - Některé ukázky kódu jsou zakomentované. Zkopírujte je do svého řešení
#   a z každého řádku odstraňte úvodní #. Nejrychleji to uděláte tak, že
#   vložené řádky označíte a zvolíte Code > Comment/Uncomment Lines
#   (Ctrl + Shift + C). Spusťte je až tehdy, když už existují objekty,
#   které používají.
#
# Když se něco pokazí:
# Pokud objekty v Environmentu neodpovídají skriptu, zvolte Session >
# Restart R. Restart smaže objekty z paměti, ale uložené soubory zůstanou.
# Potom znovu spusťte přípravu a své hotové hlavní úlohy shora dolů.

#--------------------------------------------------#
## Výsledky učení a předpoklady -----
#--------------------------------------------------#
# Po cvičení byste měli umět:
# - sestavit několik biologicky zdůvodněných kandidátních modelů,
# - vysvětlit, proč samotné R² nestačí k výběru modelu,
# - porovnat modely pomocí R², adjustovaného R² a AIC,
# - pomocí diagnostických grafů posoudit, zda vybraný model dobře
#   vystihuje data.
#
# Navazujeme na předchozí lekce: datové rámce, faktory, lm(), vzorce
# s + a *, predict(), residua, Q–Q grafy a vliv jednotlivých pozorování.
# Nové funkce vysvětlujeme vždy u úlohy, kde je poprvé potřebujete.

#--------------------------------------------------#
## Technická kontrola a data -----
#--------------------------------------------------#
# Následující kód načte data. Označte ho celý a spusťte Ctrl + Enter.
# Cesta k souboru začíná ve složce otevřeného projektu. Pokud soubor
# chybí, R se zastaví a vypíše, co máte zkontrolovat.
soubor_stromy <- "data/allometrie_stromu.csv"
if (
  !file.exists(file = soubor_stromy)) {
  stop(
    paste0(
      "Soubor data/allometrie_stromu.csv nebyl nalezen. ",
      "Otevřete projekt L09_praktikum a zkontrolujte jméno ",
      "a umístění CSV v podsložce data."
    ),
    call. = FALSE
  )
}
# Textové sloupce ponecháme jako text a sloupec s druhem převedeme
# na faktor.
data_stromy <-
  read.csv(
    file = soubor_stromy,
    stringsAsFactors = FALSE,
    check.names = FALSE
  )
data_stromy$druh_stromu <- factor(x = data_stromy$druh_stromu)
# Jeden řádek tabulky představuje jeden strom. Číslo řádku je jen pořadí
# v tabulce, nikoli označení stromu v terénu. Proměnné a jednotky:
# druh_stromu       ... vědecký název druhu;
# prumer_kmene_cm   ... průměr kmene ve výšce 1,3 m, v cm;
# vyska_stromu_m    ... výška stromu v m;
# plocha_listu_m2   ... celková plocha listů v m²;
# hmotnost_vetvi_kg ... suchá hmotnost větví v kg.
# Zdroj: allometry, lgrdata 0.1.1, John Marshall, University of Idaho, CC0.
# Podrobnosti najdete v datovém README lekce.
#
# Druhy budeme v grafech rozlišovat barvou i tvarem bodu, proto si
# připravíme dva vektory. Zápis vec_barvy_druhu[data_stromy$druh_stromu]
# vybírá barvy podle pořadí úrovní faktoru, ne podle jmen. Funguje správně,
# protože jména ve vektorech mají stejné pořadí jako
# levels(x = data_stromy$druh_stromu).
vec_barvy_druhu <-
  c(
    "Pinus monticola" = "#3B7A57",
    "Pinus ponderosa" = "#9A6B35",
    "Pseudotsuga menziesii" = "#566D8C"
  )
vec_symboly_druhu <-
  c(
    "Pinus monticola" = 16,
    "Pinus ponderosa" = 17,
    "Pseudotsuga menziesii" = 15
  )

#----------------------------------------------------------#
# Připomenutí vzorců -----
#----------------------------------------------------------#
# Pokud se ve vzorcích lm() orientujete, můžete tento blok přeskočit.
#
# Vzorce modelů (odezva je vysvětlovaná proměnná, x číselný prediktor,
# skupina faktor):
# - odezva ~ x            jedna přímka pro všechny skupiny;
# - odezva ~ x + skupina  každá skupina má vlastní intercept, sklon je
#                         společný (rovnoběžné přímky);
# - odezva ~ x * skupina  každá skupina má vlastní intercept i sklon
#                         (model s interakcí).
#
# Faktor se třemi úrovněmi přidá do modelu dva koeficienty (kontrasty).
# Každý vyjadřuje rozdíl jedné úrovně oproti referenční úrovni. Referenční
# druh je první v levels(x = data_stromy$druh_stromu).
#
# Výběr z tabulky:
# - $ vybírá sloupec podle jména, například data_stromy$vyska_stromu_m.
# - x[řádky, sloupce] vybírá část tabulky. Prázdné místo znamená
#   „všechny řádky“ nebo „všechny sloupce“.
# - x[podmínka, ] vybere řádky, ve kterých je podmínka TRUE.
# - Záporné číslo řádek vynechá: data_stromy[-1, ] vynechá první řádek.

#----------------------------------------------------------#
# Hlavní úlohy -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Jak se výška mění s průměrem? -----
#--------------------------------------------------#
# Ukázka: nejprve se podíváme, jak data vypadají.
# - head() vypíše prvních šest řádků.
# - str() ukáže typ každého sloupce.
# - colSums(x = is.na(...)) spočítá v každém sloupci chybějící hodnoty.
#   is.na() vrací TRUE pro chybějící hodnotu a při sčítání se TRUE počítá
#   jako 1, FALSE jako 0.
head(
  x = data_stromy,
  n = 6
)
str(object = data_stromy)
colSums(x = is.na(x = data_stromy))

#----------------------------------------#
### Úloha | L09-U01 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_stromy.
# 1. Zjistěte, kolik stromů tabulka obsahuje a kolik stromů je od každého
#    druhu.
# 2. Podle výstupu colSums() z ukázky zapište do komentáře, zda chybí
#    nějaká výška, průměr nebo druh.
# 3. Nakreslete bodový graf výšky stromu (osa y) proti průměru kmene
#    (osa x). Druhy odlište barvou a tvarem bodu pomocí vec_barvy_druhu
#    a vec_symboly_druhu. Osy popište včetně jednotek.
# 4. Do komentáře napište biologickou otázku, kterou lze na těchto datech
#    zkoumat, a co v grafu vidíte.

# Vaše řešení:


# Očekávaný výsledek:
# Tabulka obsahuje 63 stromů: 19 Pinus monticola, 22 Pinus ponderosa
# a 22 Pseudotsuga menziesii. Žádná hodnota nechybí. Výška s průměrem
# kmene roste, ale body neleží úplně na přímce.
#
# Nápověda 1:
# Počet stromů je počet řádků tabulky. Počet stromů každého druhu je
# četnost jednotlivých úrovní faktoru druh_stromu.
#
# Nápověda 2:
# Použijte nrow() a table(). V plot() nastavte x, y, xlab a ylab. Barvy
# zadejte jako col = vec_barvy_druhu[data_stromy$druh_stromu] a tvary
# obdobně jako pch = vec_symboly_druhu[...].
#
# Interpretace:
# Graf ukazuje rozdíly mezi druhy. Proč z něj ještě nemůžeme tvrdit, že
# rozdíl ve výšce způsobuje druh?

#--------------------------------------------------#
## Tři biologické představy -----
#--------------------------------------------------#
# Vztah výšky stromu a průměru kmene si můžeme představit třemi způsoby:
#
# 1. Společná přímka: všechny tři druhy sdílejí jednu přímku.
# 2. Posun mezi druhy: každý druh má vlastní přímku, ale všechny jsou
#    rovnoběžné. Při stejném průměru může být jeden druh vyšší než jiný,
#    rozdíl je však u tenkých i tlustých stromů stejný.
# 3. Různé sklony: každý druh má vlastní přímku s vlastním sklonem.
#    Rozdíl výšek mezi druhy se proto může s průměrem kmene měnit.
#
# Každou představu zapíšeme jako jeden lineární model. Těmto modelům
# říkáme kandidátní modely. Všechny tři sestavíme dříve, než je začneme
# porovnávat čísly.
#
# Ukázka pro první představu, společnou přímku:
mod_spolecny <-
  lm(
    formula = vyska_stromu_m ~ prumer_kmene_cm,
    data = data_stromy
  )
coef(object = mod_spolecny)

#----------------------------------------#
### Úloha | L09-U02 -----
#----------------------------------------#

# Zadání:
# 1. Podle ukázky vytvořte z data_stromy zbývající dva kandidátní modely:
#
#      mod_aditivni:  vyska_stromu_m ~ prumer_kmene_cm + druh_stromu
#      mod_interakce: vyska_stromu_m ~ prumer_kmene_cm * druh_stromu
#
# 2. Funkce nobs() vrací počet pozorování, která model použil. Zjistěte
#    tento počet u všech tří modelů, tedy i u mod_spolecny.
# 3. Ke každému z nových modelů napište do komentáře, které ze tří
#    představ odpovídá.

# Vaše řešení:


# Očekávaný výsledek:
# Všechny tři modely použily 63 stromů. Model se znaménkem + odpovídá
# rovnoběžným přímkám, model se znaménkem * přímkám s různými sklony.
#
# Nápověda 1:
# U každého vzorce si položte dvě otázky. Smí mít druhy při stejném průměru
# různou výšku? Smí mít přímky druhů různý sklon?
#
# Nápověda 2:
# Zkopírujte ukázku lm() a změňte jen název objektu a vzorec v argumentu
# formula. Počet
# pozorování zjistíte například jako nobs(object = mod_aditivni).
#
# Interpretace:
# Proč všechny kandidátní modely sestavujeme dříve, než uvidíme, který
# z nich vychází v číslech nejlépe?

#--------------------------------------------------#
## Co se změnilo na přímkách? -----
#--------------------------------------------------#
# Abychom modely viděli, nakreslíme jejich přímky do grafu. K tomu
# potřebujeme tabulku průměrů kmene, pro které model odhadne výšku.
# Následující kód tuto tabulku vytvoří; spusťte ho beze změn.
# - seq() vytvoří 40 rovnoměrně rozložených průměrů od 7 do 69 cm.
#   Tento rozsah leží uvnitř naměřených průměrů každého druhu.
# - expand.grid() z nich vytvoří všechny kombinace průměru a druhu,
#   tedy 40 × 3 = 120 řádků.
data_predikce <-
  expand.grid(
    prumer_kmene_cm = seq(
      from = 7,
      to = 69,
      length.out = 40
    ),
    druh_stromu = levels(x = data_stromy$druh_stromu),
    KEEP.OUT.ATTRS = FALSE,
    stringsAsFactors = FALSE
  )
data_predikce$druh_stromu <-
  factor(
    x = data_predikce$druh_stromu,
    levels = levels(x = data_stromy$druh_stromu)
  )
# Ukázka: odhady výšky podle společné přímky uložíme do nového sloupce.
# predict() spočítá odhad pro každý řádek tabulky data_predikce.
data_predikce$odhad_spolecny_m <-
  predict(
    object = mod_spolecny,
    newdata = data_predikce
  )
# Níže je kostra grafu pro aditivní model. Použijete ji v U03, až vytvoříte
# sloupec odhad_aditivni_m. plot() nakreslí naměřené stromy a každé lines()
# pak přímku jednoho druhu. Podmínka v hranatých závorkách vybere řádky
# daného druhu.
# plot(
#   x = data_stromy$prumer_kmene_cm,
#   y = data_stromy$vyska_stromu_m,
#   col = vec_barvy_druhu[data_stromy$druh_stromu],
#   pch = vec_symboly_druhu[data_stromy$druh_stromu],
#   xlab = "Průměr kmene (cm)",
#   ylab = "Výška stromu (m)",
#   main = "Posun mezi druhy"
# )
# lines(
#   x = data_predikce$prumer_kmene_cm[data_predikce$druh_stromu == "Pinus monticola"],
#   y = data_predikce$odhad_aditivni_m[data_predikce$druh_stromu == "Pinus monticola"],
#   col = vec_barvy_druhu["Pinus monticola"],
#   lwd = 2
# )
# lines(
#   x = data_predikce$prumer_kmene_cm[data_predikce$druh_stromu == "Pinus ponderosa"],
#   y = data_predikce$odhad_aditivni_m[data_predikce$druh_stromu == "Pinus ponderosa"],
#   col = vec_barvy_druhu["Pinus ponderosa"],
#   lwd = 2
# )
# lines(
#   x = data_predikce$prumer_kmene_cm[data_predikce$druh_stromu == "Pseudotsuga menziesii"],
#   y = data_predikce$odhad_aditivni_m[data_predikce$druh_stromu == "Pseudotsuga menziesii"],
#   col = vec_barvy_druhu["Pseudotsuga menziesii"],
#   lwd = 2
# )
# legend(
#   x = "topleft",
#   legend = names(x = vec_barvy_druhu),
#   col = vec_barvy_druhu,
#   pch = vec_symboly_druhu,
#   lty = 1,
#   lwd = 2,
#   bty = "n"
# )

#----------------------------------------#
### Úloha | L09-U03 -----
#----------------------------------------#

# Zadání:
# 1. Podle ukázky přidejte do data_predikce dva sloupce s odhady výšky:
#    odhad_aditivni_m z mod_aditivni a odhad_interakce_m z mod_interakce.
# 2. Zkopírujte kostru grafu, odstraňte # a nakreslete graf aditivního
#    modelu.
# 3. Kostru zkopírujte ještě dvakrát: jednou pro společnou přímku, jednou
#    pro model s interakcí. V každé kopii přepište ve všech třech lines()
#    v řádku y = sloupec odhad_aditivni_m na odhad_spolecny_m, resp.
#    odhad_interakce_m. Změňte také název grafu v main, například na
#    "Společná přímka" a "Různé sklony".
#
# Ve všech třech grafech zůstávají stejné body, osy i legenda; mění se
# jen přímky.

# Vaše řešení:


# Očekávaný výsledek:
# Každý nový sloupec obsahuje 120 odhadů. U společné přímky se přímky
# všech tří druhů překrývají. Aditivní přímky jsou rovnoběžné. Přímky
# modelu s interakcí mají různé sklony.
#
# Nápověda 1:
# Každý nový sloupec vznikne stejně jako odhad_spolecny_m v ukázce; liší
# se jen model, ze kterého odhad pochází.
#
# Nápověda 2:
# V predict() změňte jen object, newdata = data_predikce ponechte. V kopiích
# grafu měňte jen název sloupce za data_predikce$ v řádku y = ...; řádek
# x = ... ani podmínky v hranatých závorkách neměňte.
#
# Interpretace:
# Je z grafů vidět, že model s interakcí popisuje data výrazně lépe?
# Stojí případné zlepšení za dva sklony navíc?

#--------------------------------------------------#
## Jakou část variability zachytil model? -----
#--------------------------------------------------#
# R² (koeficient determinace) říká, jakou část variability výšek model
# zachytil. Počítá se ze dvou součtů čtverců:
# - SST: jak moc se výšky liší od své průměrné hodnoty. Pro každý strom
#   spočítáme rozdíl jeho výšky od průměru, umocníme ho na druhou a vše
#   sečteme.
# - RSS: jak moc se výšky liší od odhadů modelu. Sečteme druhé mocniny
#   residuí.
# R² = 1 − RSS/SST. Tento vzorec platí pro modely s interceptem, tedy pro
# všechny naše modely.
#
# Ukázka pro společnou přímku:
vec_rozdily_od_prumeru <-
  data_stromy$vyska_stromu_m - mean(x = data_stromy$vyska_stromu_m)
sst_vyska <- sum(vec_rozdily_od_prumeru^2)
rss_spolecny <- sum(residuals(object = mod_spolecny)^2)
r2_spolecny <- 1 - rss_spolecny / sst_vyska
# summary() vrací souhrn modelu; $r.squared z něj vybere R².
# all.equal() porovná dvě čísla a přehlédne nepatrné rozdíly vzniklé
# zaokrouhlováním v počítači. Pokud se čísla shodují, vrátí TRUE.
all.equal(
  target = r2_spolecny,
  current = summary(object = mod_spolecny)$r.squared
)

#----------------------------------------#
### Úloha | L09-U04 -----
#----------------------------------------#

# Zadání:
# 1. Podle ukázky spočítejte RSS a R² pro mod_aditivni a mod_interakce.
#    SST znovu nepočítejte: všechny modely mají stejnou odezvu i stejné
#    stromy, takže sst_vyska platí pro všechny. Výsledky uložte jako
#    rss_aditivni, r2_aditivni, rss_interakce a r2_interakce.
# 2. Pomocí all.equal() ověřte, že vaše R² odpovídá hodnotě ze summary().
# 3. Porovnejte RSS a R² všech tří modelů a do komentáře zapište, jak se
#    mění od společné přímky k modelu s interakcí.

# Vaše řešení:


# Očekávaný výsledek:
# SST je přibližně 8084,56. R² společné přímky je 0,768, aditivního modelu
# asi 0,793 a modelu s interakcí asi 0,797. Od společné přímky
# přes aditivní model k modelu s interakcí RSS klesá a R² roste. Kontroly
# all.equal() vrátí TRUE.
#
# Nápověda 1:
# Složitější model obsahuje jednodušší jako zvláštní případ. Na stejných
# datech proto nemůže mít větší RSS.
#
# Nápověda 2:
# Zkopírujte řádky s rss_spolecny a r2_spolecny a změňte v nich model
# a názvy objektů. Dejte pozor na pořadí: nejdřív umocněte každé residuum,
# potom sčítejte.
#
# Interpretace:
# R² po přidání interakce vzrostlo. Proč to samo o sobě neznamená, že je
# model s interakcí lepší? Co R² neříká o příčinách vztahu ani o tom,
# jak by model fungoval na jiných datech?

#--------------------------------------------------#
## Vyváží zlepšení další koeficienty? -----
#--------------------------------------------------#
# Když do modelu přidáme další koeficienty, obyčejné R² nikdy neklesne.
# Adjustované R² proto každý další koeficient penalizuje:
#
#   adjustované R² = 1 − (1 − R²) × (n − 1)/(n − k)
#
# n je počet pozorování (stromů) a k počet regresních koeficientů včetně
# interceptu. Funkcí coef() získáme koeficienty modelu a funkcí length()
# je spočítáme.
#
# Ukázka pro společnou přímku:
n_stromy <- nobs(object = mod_spolecny)
k_spolecny <- length(x = coef(object = mod_spolecny))
r2_adj_spolecny <-
  1 - (1 - r2_spolecny) * (n_stromy - 1) / (n_stromy - k_spolecny)
# $adj.r.squared vybírá ze summary() adjustované R², nikoli obyčejné R².
all.equal(
  target = r2_adj_spolecny,
  current = summary(object = mod_spolecny)$adj.r.squared
)

#----------------------------------------#
### Úloha | L09-U05 -----
#----------------------------------------#

# Zadání:
# 1. Zjistěte počet koeficientů k u mod_aditivni a mod_interakce.
# 2. Vypište jejich adjustované R² ze summary().
# 3. Pro mod_aditivni spočítejte adjustované R² také podle vzorce z ukázky
#    a pomocí all.equal() ověřte shodu.
# 4. Porovnejte obyčejné a adjustované R² všech tří modelů, včetně
#    mod_spolecny. Do komentáře zapište, který model má nejvyšší obyčejné
#    a který nejvyšší adjustované R².

# Vaše řešení:


# Očekávaný výsledek:
# Modely mají 2, 4 a 6 koeficientů. Adjustované R² je nejvyšší
# u aditivního modelu (0,782), i když obyčejné R² je nejvyšší u modelu
# s interakcí.
#
# Nápověda 1:
# Druh není jeden koeficient. Každý druh kromě referenčního má vlastní
# koeficient posunu; v modelu s interakcí navíc vlastní koeficient sklonu.
#
# Nápověda 2:
# Použijte length(x = coef(object = ...)) a ze summary() vyberte
# $adj.r.squared. Ve vzorci změňte R² a k; n zůstává stejné (n_stromy).
#
# Interpretace:
# Adjustované R² po přidání interakce kleslo. Co to říká o přínosu dvou
# dalších sklonů?

#--------------------------------------------------#
## Co porovnává AIC? -----
#--------------------------------------------------#
# AIC (Akaikeho informační kritérium) také vyvažuje, jak dobře model
# vystihuje data a jak je složitý. Menší AIC znamená silnější podporu
# modelu ve srovnání s ostatními kandidáty na stejných datech. Samotná
# hodnota AIC není procento ani důkaz, že je model správný; smysl mají
# jen rozdíly mezi modely. AIC přitom nepočítá s k z předchozí části, ale
# se všemi parametry modelu; jeho hodnotu proto vždy získejte funkcí AIC().
AIC(object = mod_spolecny)
# Výsledky všech tří modelů shromáždíme do jedné tabulky. Kostra níže
# vytvoří tabulku se třemi řádky, jeden řádek pro každý model. Místo
# rep(NA_real_, times = 3) doplníte tři skutečné hodnoty ve stejném pořadí
# modelů jako ve sloupci model. (rep() opakuje hodnotu a NA_real_ znamená
# chybějící číslo, takže kostra je zatím prázdná.)
# data_porovnani <- data.frame(
#   model = c("Společná přímka", "Posun mezi druhy", "Různé sklony"),
#   n = rep(NA_real_, times = 3),
#   k = rep(NA_real_, times = 3),
#   r2 = rep(NA_real_, times = 3),
#   r2_adj = rep(NA_real_, times = 3),
#   aic = rep(NA_real_, times = 3)
# )
# ΔAIC (delta AIC) je rozdíl mezi AIC modelu a nejmenším AIC v tabulce.
# Nejlépe podporovaný model v tabulce má tedy ΔAIC = 0. min() vrátí
# nejmenší hodnotu. Když od vektoru odečtete jedno číslo, odečte se od
# každého prvku.

#----------------------------------------#
### Úloha | L09-U06 -----
#----------------------------------------#

# Zadání:
# 1. Zkopírujte kostru, odstraňte # a místo NA doplňte n, k, R²,
#    adjustované R² a AIC pro mod_spolecny, mod_aditivni a mod_interakce.
#    Výsledek uložte jako data_porovnani.
# 2. Přidejte sloupec delta_aic: od každé hodnoty aic odečtěte nejmenší aic.
# 3. Zkontrolujte, že všechny modely použily 63 stromů a že v tabulce
#    nechybí žádná hodnota.
# 4. Pro každou metriku zapište do komentáře, který model vychází nejlépe.
#    Vysvětlete,
#    proč tři metriky nejsou tři nezávislé „hlasy“ o tom, který model je
#    pravdivý.

# Vaše řešení:


# Očekávaný výsledek:
# Tabulka má 3 řádky a 7 sloupců bez chybějících hodnot. Model s interakcí
# má nejvyšší R². Aditivní model má nejvyšší adjustované R² i nejnižší
# AIC, jeho ΔAIC je tedy 0.
#
# Nápověda 1:
# Všechny hodnoty jednoho modelu patří do stejného řádku. ΔAIC počítáte
# jen z modelů, které jsou v této tabulce.
#
# Nápověda 2:
# Každý sloupec doplňte vektorem c() se třemi hodnotami. Použijte funkce
# z U02, U04 a U05 a funkci AIC(). Nový sloupec vytvoříte zápisem
# data_porovnani$delta_aic <- ...
#
# Interpretace:
# Proč by porovnání AIC ztratilo smysl, kdyby jeden model měl jinou odezvu
# nebo používal jiné stromy? Pozor: stejný počet řádků ještě neznamená
# stejné stromy.

#--------------------------------------------------#
## Obstojí podporovaný kandidát? -----
#--------------------------------------------------#
# Nejnižší AIC říká jen to, že model je nejlépe podporovaný z porovnávaných.
# Neříká, zda dobře vystihuje tvar vztahu. To ověříme diagnostickými grafy.
#
# Graf residuí proti odhadům: pokud model vztah vystihuje, body jsou kolem
# nulové čáry rozptýlené bez zřetelného vzoru. Kostru zkopírujte do řešení,
# odstraňte # a spusťte ji až po vytvoření mod_aditivni v U02:
# plot(
#   x = fitted(object = mod_aditivni),
#   y = residuals(object = mod_aditivni),
#   col = vec_barvy_druhu[data_stromy$druh_stromu],
#   pch = vec_symboly_druhu[data_stromy$druh_stromu],
#   xlab = "Odhadnutá výška (m)",
#   ylab = "Residuum (m)"
# )
# abline(h = 0, lty = 2)
# Q–Q graf porovnává residua s normálním rozdělením. Pokud jsou residua
# přibližně normální, body leží blízko přímky. qqnorm(y = ...) nakreslí
# body, qqline(y = ...) přímku.
#
# Cookova vzdálenost měří, jak moc by se model změnil, kdybychom jeden
# strom vynechali. cooks.distance(model = ...) ji vrátí pro každý strom.
# V grafu ji zobrazíme svislými úsečkami (plot() s type = "h");
# seq_along() vytvoří pořadová čísla stromů 1, 2, 3, ... pro osu x.
# Přerušovaná čára ve výšce 4/n je jen orientační: stromy nad ní stojí
# za prohlédnutí, ale nejsou důvodem strom z dat vyřadit.
#
# Kostry obou grafů použijte stejně. Q–Q graf můžete nakreslit hned,
# graf Cookových vzdáleností až po vytvoření vec_cook:
# qqnorm(
#   y = residuals(object = mod_aditivni),
#   main = "Q–Q graf residuí",
#   xlab = "Teoretické kvantily",
#   ylab = "Kvantily residuí (m)"
# )
# qqline(y = residuals(object = mod_aditivni))
# plot(
#   x = seq_along(along.with = vec_cook),
#   y = vec_cook,
#   type = "h",
#   xlab = "Pořadí stromu v tabulce",
#   ylab = "Cookova vzdálenost"
# )
# abline(
#   h = 4 / nobs(object = mod_aditivni),
#   lty = 2
# )

#----------------------------------------#
### Úloha | L09-U07 -----
#----------------------------------------#

# Zadání:
# Pracujte s mod_aditivni.
# 1. Nakreslete graf residuí proti odhadům podle kostry výše.
# 2. Nakreslete Q–Q graf residuí s přímkou.
# 3. Cookovy vzdálenosti uložte jako vec_cook a nakreslete jejich graf
#    s čarou 4/n.
# 4. Spočítejte, kolik stromů leží nad čarou 4/n.
# 5. U každého grafu napište do komentáře, co ukazuje a co z něj naopak
#    poznat nelze.

# Vaše řešení:


# Očekávaný výsledek:
# Residua tvoří oblouk: uprostřed rozsahu odhadů jsou spíše kladná,
# na okrajích spíše záporná. Body v Q–Q grafu se od přímky mírně
# odchylují. Nad čarou 4/n leží 4 stromy; ty si zaslouží prohlédnout,
# ne automaticky smazat.
#
# Nápověda 1:
# Každý graf odpovídá na jinou otázku: zda model vystihuje tvar vztahu,
# zda mají residua přibližně normální rozdělení a zda jeden strom výrazně
# ovlivňuje výsledek.
#
# Nápověda 2:
# vec_cook vytvořte pomocí cooks.distance(model = mod_aditivni). Počet
# stromů nad čarou spočítáte funkcí sum() z podmínky
# vec_cook > 4 / nobs(object = mod_aditivni); každé TRUE se počítá jako 1.
#
# Interpretace:
# Jak může mít model nejlepší AIC ze tří kandidátů, a přesto špatně
# vystihovat tvar vztahu?

#--------------------------------------------------#
## Který model pro výšku obhájíte? -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha | L09-U08 -----
#----------------------------------------#

# Zadání:
# Vraťte se k biologické otázce z U01 a do komentáře napište krátký závěr
# o několika větách. Uveďte v něm:
# - který ze tří kandidátních modelů má nejsilnější podporu,
# - proč: opřete se alespoň o dva druhy důkazů, například srovnávací
#   tabulku, grafy přímek nebo diagnostické grafy,
# - jaký biologický předpoklad vybraný model obsahuje,
# - jaká omezení váš závěr má.
# Výslovně uveďte, že model vybíráte jen z těchto tří kandidátů.

# Vaše řešení:


# Očekávaný výsledek:
# Závěr propojí čísla, biologickou otázku a diagnostiku. Vybraný model
# neoznačí za obecně správný a pojmenuje konkrétní omezení.
#
# Nápověda 1:
# Odlište dvě otázky: který model je nejlépe podporovaný z porovnávaných
# a zda tento model dobře vystihuje data.
#
# Nápověda 2:
# Porovnejte, o kolik interakce zvýšila R², s tím, co se stalo
# s adjustovaným R² a AIC. Jako omezení můžete uvést oblouk v residuích,
# omezený vzorek nebo to, že jde o pozorovací data, nikoli o experiment.
#
# Interpretace:
# Co byste potřebovali, abyste mohli tvrdit něco o modelech, které v této
# sadě nebyly?

#----------------------------------------------------------#
# Úlohy navíc -----
#----------------------------------------------------------#
# Úlohy navíc jsou dobrovolné. Vyberte si ty, které vás zajímají; nemusíte
# je řešit v pořadí. Každá používá jen objekty z hlavních úloh. Jedinou
# výjimkou je N18, která navazuje na N17.
#
# Nové tabulky a modely pojmenujte jinak než objekty z hlavních úloh, abyste
# data_stromy ani hlavní modely nepřepsali. Pokud vám uvedený objekt chybí,
# spusťte znovu příslušnou hlavní úlohu.

#--------------------------------------------------#
## Význam modelů a predikce -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L09-N01 -----
#----------------------------------------#

# Zadání:
# Vzorec s * je zkratka. Ověřte, že rozepsaný vzorec dává stejný model.
# 1. Z data_stromy vytvořte model mod_rozpis s odezvou vyska_stromu_m.
#    Místo * v něm vypište zvlášť oba hlavní efekty (prumer_kmene_cm,
#    druh_stromu) a jejich interakci prumer_kmene_cm:druh_stromu.
#    Dvojtečka označuje samotnou interakci.
# 2. Pomocí all.equal() porovnejte koeficienty mod_rozpis a mod_interakce.
# 3. Stejně porovnejte jejich fitted(). fitted(object = ...) vrací odhady
#    modelu pro naměřené stromy, nikoli pro novou tabulku jako predict().

# Vaše řešení:


# Očekávaný výsledek:
# Obě kontroly vrátí TRUE. mod_rozpis má stejných šest koeficientů jako
# mod_interakce.
#
# Nápověda 1:
# Hvězdička ve vzorci zahrnuje oba hlavní efekty i jejich interakci.
#
# Nápověda 2:
# Členy vzorce spojte znaménkem +. Porovnejte coef(object = ...) obou
# modelů a potom fitted(object = ...) obou modelů.
#
# Interpretace:
# Přinesl rozepsaný vzorec novou biologickou představu, nebo jen jiný
# zápis té stejné?

#----------------------------------------#
### Úloha navíc | L09-N02 -----
#----------------------------------------#

# Zadání:
# Koeficienty druhů vyjadřují rozdíl oproti referenčnímu druhu. Zatím je
# referenční druh Pinus monticola, první úroveň faktoru. Zjistěte, co se
# stane, když referenci změníte.
# 1. Spusťte následující kód (z každého řádku odstraňte jeden úvodní #).
#    Vytvoří kopii dat, ve které je referenčním druhem Pseudotsuga
#    menziesii; relevel() změní pořadí úrovní faktoru.
# data_reference <- data_stromy
# data_reference$druh_stromu <- relevel(
#   x = data_reference$druh_stromu,
#   ref = "Pseudotsuga menziesii"
# )
# 2. Na data_reference vytvořte aditivní model mod_reference se stejným
#    vzorcem jako mod_aditivni.
# 3. Porovnejte coef() obou modelů.
# 4. Pomocí all.equal() porovnejte jejich odhady pro data_predikce
#    (predict()), R², adjustované R² a AIC.
#
# Pozor: v data_reference mají úrovně faktoru jiné pořadí, takže
# vec_barvy_druhu by druhům přiřadil špatné barvy. Tato data nekreslete.

# Vaše řešení:


# Očekávaný výsledek:
# Koeficienty se liší, protože popisují rozdíly vůči jinému druhu. Odhady,
# R², adjustované R² i AIC jsou stejné.
#
# Nápověda 1:
# Tutéž sadu rovnoběžných přímek lze popsat vůči kterémukoli druhu.
#
# Nápověda 2:
# Porovnávejte predict() obou modelů se stejným newdata = data_predikce.
# Koeficienty pomocí all.equal() neporovnávejte: mají jiné názvy i význam.
#
# Interpretace:
# Ke kterému druhu se teď vztahuje intercept? Vůči kterému druhu se měří
# rozdíly ostatních druhů?

#----------------------------------------#
### Úloha navíc | L09-N03 -----
#----------------------------------------#

# Zadání:
# 1. Vypište coef() pro mod_spolecny, mod_aditivni a mod_interakce.
# 2. U každého koeficientu napište, co biologicky znamená. Vybírejte z:
#    výška stromu při nulovém průměru (intercept), sklon, posun druhu oproti
#    referenčnímu druhu, změna sklonu druhu oproti referenčnímu druhu.
# 3. Vysvětlete, proč pro tři druhy stačí dva koeficienty druhu.

# Vaše řešení:


# Očekávaný výsledek:
# Modely mají 2, 4 a 6 koeficientů. Intercept je odhad výšky stromu
# s průměrem kmene 0 cm; v modelech s druhem platí pro referenční druh
# Pinus monticola. Takový strom v datech není, proto intercept nemá přímý
# biologický význam.
#
# Nápověda 1:
# Referenční druh už popisuje intercept a základní sklon. Ostatní
# koeficienty druhu jsou rozdíly oproti němu.
#
# Nápověda 2:
# V mod_interakce získáte intercept dalšího druhu jako intercept + jeho
# koeficient posunu a jeho sklon jako základní sklon + jeho interakční
# koeficient.
#
# Interpretace:
# Při jakém průměru kmene platí rozdíl výšek, který udává koeficient druhu
# v modelu s interakcí?

#----------------------------------------#
### Úloha navíc | L09-N04 -----
#----------------------------------------#

# Zadání:
# Porovnejte, jak se odhadovaná výška druhů liší u tenčích a tlustších
# stromů.
# 1. Spusťte následující kód (z každého řádku odstraňte jeden úvodní #).
#    Vytvoří tabulku se šesti řádky: tři druhy při průměrech 30 a 60 cm.
# data_dva_prumery <- expand.grid(
#   prumer_kmene_cm = c(30, 60),
#   druh_stromu = levels(x = data_stromy$druh_stromu),
#   KEEP.OUT.ATTRS = FALSE,
#   stringsAsFactors = FALSE
# )
# data_dva_prumery$druh_stromu <- factor(
#   x = data_dva_prumery$druh_stromu,
#   levels = levels(x = data_stromy$druh_stromu)
# )
# 2. Pomocí predict() přidejte do tabulky dva sloupce s odhady výšky:
#    odhad_aditivni_m z mod_aditivni a odhad_interakce_m z mod_interakce.
# 3. Pro každý model a oba průměry spočítejte rozdíl odhadované výšky
#    Pseudotsuga menziesii minus Pinus monticola.

# Vaše řešení:


# Očekávaný výsledek:
# Tabulka má šest řádků. V aditivním modelu je rozdíl při 30 i 60 cm
# stejný, asi −4,17 m. V modelu s interakcí se mění: asi −3,73 m při 30 cm
# a −5,96 m při 60 cm.
#
# Nápověda 1:
# Rovnoběžné přímky jsou od sebe všude stejně daleko.
#
# Nápověda 2:
# Vypište tabulku: řádky 1–2 patří Pinus monticola, řádky 5–6 Pseudotsuga
# menziesii. Odečítejte odhady z tabulky, ne naměřené výšky stromů.
#
# Interpretace:
# Jakou biologickou odlišnost mezi druhy připouští model s interakcí, ale
# aditivní model ne?

#--------------------------------------------------#
## Porozumění srovnávacím ukazatelům -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L09-N05 -----
#----------------------------------------#

# Zadání:
# 1. Vytvořte kopii hotové data_porovnani z U06 s názvem data_zaokrouhlena.
# 2. V kopii zaokrouhlete R² a adjustované R² na dvě desetinná místa a AIC
#    na celá čísla. round(x = ..., digits = ...) zaokrouhlí na zadaný počet
#    desetinných míst.
# 3. Porovnejte zaokrouhlené hodnoty s původními. Změnilo se po zaokrouhlení
#    pořadí modelů nebo velikost rozdílů mezi nimi?

# Vaše řešení:


# Očekávaný výsledek:
# Adjustované R² obou modelů s druhem se po zaokrouhlení shoduje (0,78).
# AIC společné přímky a modelu s interakcí se naopak liší o 1, ačkoli
# skutečný rozdíl je asi 0,37. Zaokrouhlení tedy rozdíly skrývá i zvětšuje.
# Pro výpočty i rozhodování proto používejte nezaokrouhlené hodnoty.
#
# Nápověda 1:
# Zaokrouhlené číslo nese méně informace než původní výpočet.
#
# Nápověda 2:
# Každý sloupec kopie přepište zvlášť, například
# data_zaokrouhlena$r2 <- round(...). Pro AIC použijte digits = 0.
# Zaměřte se na adjustované R² obou modelů s druhem a na AIC společné
# přímky a modelu s interakcí.
#
# Interpretace:
# Co smíte a co nesmíte vyvozovat ze zaokrouhlených hodnot v tabulce?

#----------------------------------------#
### Úloha navíc | L09-N06 -----
#----------------------------------------#

# Zadání:
# Zopakujte výpočet adjustovaného R² z U05, tentokrát pro mod_interakce.
# 1. Zjistěte n, k a obyčejné R² modelu mod_interakce.
# 2. Dosaďte je do vzorce pro adjustované R² z U05.
# 3. Pomocí all.equal() ověřte shodu se summary(object = mod_interakce).
# 4. Porovnejte výsledek s adjustovaným R² modelu mod_aditivni.

# Vaše řešení:


# Očekávaný výsledek:
# Váš výpočet se shoduje se summary(). Adjustované R² modelu s interakcí
# je nižší než u aditivního modelu, přestože jeho obyčejné R² je vyšší.
#
# Nápověda 1:
# Adjustované R² porovnává zlepšení shody s daty s cenou za další
# koeficienty.
#
# Nápověda 2:
# k je length(x = coef(object = mod_interakce)), tedy včetně interceptu.
# Ve vzorci použijte n - k, nikoli n - k - 1.
#
# Interpretace:
# Proč samotný růst R² nestačí k obhajobě složitějšího modelu?

#----------------------------------------#
### Úloha navíc | L09-N07 -----
#----------------------------------------#

# Zadání:
# RSS lze získat dvěma způsoby. Funkce deviance(object = ...) vrací
# u modelů z lm() právě RSS.
# 1. Pro mod_aditivni spočítejte RSS jako součet druhých mocnin residuí.
# 2. Pomocí all.equal() ověřte, že stejnou hodnotu vrací deviance().
# 3. Z RSS a sst_vyska spočítejte R² a ověřte ho podle summary().

# Vaše řešení:


# Očekávaný výsledek:
# Obě hodnoty RSS se shodují. R² je stejné jako v U04 (přibližně 0,793).
#
# Nápověda 1:
# R² říká, jaká část celkové variability výšek nezůstala v residuích.
#
# Nápověda 2:
# Zkopírujte řádky rss_spolecny a r2_spolecny z ukázky před U04 a změňte
# v nich model. deviance() zavolejte se stejným modelem.
#
# Interpretace:
# Proč musí mít všechny tři modely stejné SST, abyste mohli jejich R²
# porovnat?

#----------------------------------------#
### Úloha navíc | L09-N08 -----
#----------------------------------------#

# Zadání:
# Vyzkoušejte, jak ΔAIC závisí na tom, které modely porovnáváte.
# 1. Z data_porovnani vytvořte data_dva_kandidati bez prostředního řádku,
#    tedy bez aditivního modelu.
# 2. Znovu spočítejte delta_aic, tentokrát jen z AIC zbylých dvou modelů.

# Vaše řešení:


# Očekávaný výsledek:
# Model s interakcí má nyní ΔAIC = 0 a společná přímka ΔAIC přibližně
# 0,374. Samotné hodnoty AIC obou modelů se nezměnily.
#
# Nápověda 1:
# ΔAIC = 0 má vždy nejlépe podporovaný model z těch, které jsou právě
# v tabulce.
#
# Nápověda 2:
# Řádky vyberte jako data_porovnani[c(1, 3), ]. Od sloupce aic nové tabulky
# odečtěte jeho nové minimum, ne minimum původní tabulky se třemi modely.
#
# Interpretace:
# Proč musí věta „model má nejnižší AIC“ vždy říct, ze kterých modelů?

#--------------------------------------------------#
## Odhalování neplatných srovnání -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L09-N09 -----
#----------------------------------------#

# Zadání:
# Modely lze porovnávat jen tehdy, když používají stejné stromy. Zjistěte,
# co se stane, když jedna hodnota chybí.
# 1. Spusťte následující kód (z každého řádku odstraňte jeden úvodní #).
#    V kopii dat uměle smaže druh prvního stromu; v původním CSV žádná
#    hodnota nechybí.
# data_chybejici <- data_stromy
# data_chybejici$druh_stromu[1] <- NA
# 2. Na data_chybejici vytvořte všechny tři výškové modely pod novými
#    názvy.
# 3. U každého modelu zjistěte nobs() a které řádky použil. Čísla
#    použitých řádků vrací rownames(x = model.frame(formula = ...)),
#    kde za formula dosadíte model.
#    R vynechá každý řádek, ve kterém chybí hodnota potřebná pro daný
#    vzorec. Společný model druh nepoužívá, takže řádek nevynechá.
# 4. Opravte porovnání. Následující kód vytvoří tabulku jen z řádků, ve
#    kterých nechybí výška, průměr ani druh; complete.cases() označí řádky
#    bez NA ve vybraných sloupcích. Na této tabulce vytvořte všechny tři
#    modely znovu.
# data_uplne <- data_chybejici[
#   complete.cases(
#     data_chybejici[c("vyska_stromu_m", "prumer_kmene_cm", "druh_stromu")]
#   ),
# ]

# Vaše řešení:


# Očekávaný výsledek:
# Na data_chybejici použije společný model 63 řádků, oba modely s druhem 62.
# Všechny tři opravené modely použijí stejných 62 řádků. Původní data_stromy
# zůstanou beze změny.
#
# Nápověda 1:
# Chybějící hodnota vyřadí řádek jen z modelu, který tuto proměnnou
# používá.
#
# Nápověda 2:
# Čísla řádků opravených modelů porovnejte po dvojicích pomocí
# identical(x = ..., y = ...). Nestačí porovnat jejich počet.
#
# Interpretace:
# Co byste museli zjistit o skutečně chybějících datech, než byste je
# vynechali?

#----------------------------------------#
### Úloha navíc | L09-N10 -----
#----------------------------------------#

# Zadání:
# Stejný počet stromů ještě neznamená stejné stromy.
# 1. Vytvořte dvě tabulky, každou bez jednoho stromu:
#    data_bez_prvniho <- data_stromy[-1, ]
#    data_bez_posledniho <- data_stromy[-nrow(x = data_stromy), ]
# 2. Na každé vytvořte aditivní model výšky, každý pod jiným názvem.
# 3. Porovnejte nobs() obou modelů a čísla použitých řádků
#    z rownames(x = model.frame(formula = ...)).
# 4. Rozhodněte, zda lze AIC těchto dvou modelů porovnat. Pořadí podle AIC
#    nesestavujte.

# Vaše řešení:


# Očekávaný výsledek:
# Oba modely použily 62 stromů, ale ne tytéž: prvnímu chybí strom z řádku 1,
# druhému strom z řádku 63.
#
# Nápověda 1:
# Počet pozorování neříká, které konkrétní stromy model použil.
#
# Nápověda 2:
# identical(x = ..., y = ...) vrátí pro počty TRUE, ale pro čísla řádků
# FALSE. Podívejte se na první a poslední čísla řádků obou modelů.
#
# Interpretace:
# Jak byste data připravili, aby oba modely používaly přesně stejné stromy?

#----------------------------------------#
### Úloha navíc | L09-N11 -----
#----------------------------------------#

# Zadání:
# AIC lze porovnávat jen mezi modely se stejnou odezvou.
# 1. Na data_stromy vytvořte model mod_hmotnost: odezvou je suchá
#    hmotnost větví hmotnost_vetvi_kg (kg), prediktorem prumer_kmene_cm.
# 2. Vypište AIC tohoto modelu a AIC modelu mod_spolecny.
# 3. Posuďte tvrzení: „Menší z těchto dvou AIC určuje, kterou odezvu má
#    biolog dále zkoumat.“

# Vaše řešení:


# Očekávaný výsledek:
# Oba modely používají stejných 63 stromů, ale mají jinou odezvu v jiných
# jednotkách. Tvrzení odmítnete a pro výšku a hmotnost nepočítáte společné
# ΔAIC.
#
# Nápověda 1:
# Porovnání kandidátních modelů odpovídá na jednu otázku o stejné odezvě
# na stejných datech.
#
# Nápověda 2:
# Porovnejte levou stranu vzorců obou modelů a jednotky proměnných, nejen
# nobs().
#
# Interpretace:
# Jak by vypadala správná sada kandidátních modelů pro otázku o hmotnosti
# větví?

#----------------------------------------#
### Úloha navíc | L09-N12 -----
#----------------------------------------#

# Zadání:
# Častou chybou při výpočtu RSS je umocnit až součet residuí.
# 1. Spočítejte chybnou verzi: sum(residuals(object = mod_aditivni))^2.
# 2. Spočítejte správnou verzi: součet druhých mocnin jednotlivých residuí.
# 3. Správnou hodnotu ověřte pomocí deviance(object = mod_aditivni);
#    u modelů z lm() vrací deviance() právě RSS.

# Vaše řešení:


# Očekávaný výsledek:
# Chybná verze dá téměř nulu, správné RSS je přibližně 1674,55 m².
#
# Nápověda 1:
# Kladná a záporná residua se při sčítání navzájem vyruší.
#
# Nápověda 2:
# Umocnění přesuňte dovnitř sum(), aby se umocnilo každé residuum zvlášť.
#
# Interpretace:
# Proč téměř nulový součet residuí neznamená, že model odhaduje výšky
# téměř bez chyb?

#--------------------------------------------------#
## Diagnostika a omezení -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L09-N13 -----
#----------------------------------------#

# Zadání:
# Najděte strom s největší Cookovou vzdáleností v mod_aditivni a podívejte
# se, kde v grafech leží.
# 1. Spočítejte Cookovy vzdálenosti a pomocí which.max(x = ...) zjistěte
#    pořadí stromu s největší hodnotou. which.max() vrací pozici
#    největšího prvku. Výsledek uložte jako index_max.
# 2. Vypište celý řádek tohoto stromu z data_stromy.
# 3. Nakreslete graf výšky (osa y) proti průměru kmene (osa x) a strom
#    v něm zvýrazněte. Použijte vzor níže; points() přidá bod do již
#    nakresleného grafu a cex určuje jeho velikost.
# points(
#   x = data_stromy$prumer_kmene_cm[index_max],
#   y = data_stromy$vyska_stromu_m[index_max],
#   pch = 1,
#   cex = 2,
#   col = "red"
# )
# 4. Stejný strom zvýrazněte i v grafu residuí proti odhadům (fitted()).

# Vaše řešení:


# Očekávaný výsledek:
# Najdete strom z řádku 12 a popíšete, kde v obou grafech leží.
# Velký vliv sám o sobě nedokazuje, že jde o chybu měření.
#
# Nápověda 1:
# Vliv stromu závisí na tom, jak daleko leží jeho průměr kmene od ostatních,
# i na velikosti jeho residua.
#
# Nápověda 2:
# Řádek vypíšete jako data_stromy[index_max, ]. Ve druhém grafu použijte
# v points() hodnoty fitted(object = mod_aditivni)[index_max] a obdobně
# residuals().
#
# Interpretace:
# Jaké údaje o měření byste si vyžádali, než byste navrhli záznam opravit?

#----------------------------------------#
### Úloha navíc | L09-N14 -----
#----------------------------------------#

# Zadání:
# Citlivostní analýza zkoumá, zda se závěr změní, když se data trochu
# změní. Nejde o zdůvodnění, proč strom vyřadit; původní data a modely
# zachovejte.
# 1. Z mod_aditivni znovu určete pořadí stromu s největší Cookovou
#    vzdáleností. which.max(x = ...) vrací pozici největší hodnoty.
# 2. Vytvořte data_citlivost bez tohoto řádku.
# 3. Na data_citlivost vytvořte všechny tři výškové modely.
# 4. Pro nové modely sestavte tabulku R², adjustovaného R², AIC a ΔAIC.
# 5. Porovnejte pořadí modelů s data_porovnani. Samotné hodnoty AIC mezi
#    63 a 62 stromy neporovnávejte, protože jde o jiná data.

# Vaše řešení:


# Očekávaný výsledek:
# Tři nové modely použijí stejných 62 stromů. Závěr výslovně uvede, že
# se data změnila, a řekne, zda nejlépe podporovaný model zůstal stejný.
#
# Nápověda 1:
# Jde o dvě různé otázky: zda je závěr stabilní a zda je správné strom
# vyřadit.
#
# Nápověda 2:
# Řádek vynecháte záporným indexem
# z which.max(x = cooks.distance(model = mod_aditivni)). ΔAIC počítejte
# jen z nové trojice modelů, jako v U06.
#
# Interpretace:
# Co byste uvedli v závěru, kdyby se po vynechání stromu pořadí modelů
# změnilo?

#----------------------------------------#
### Úloha navíc | L09-N15 -----
#----------------------------------------#

# Zadání:
# 1. Vytvořte data_residua jako kopii data_stromy a přidejte do ní sloupec
#    residuum_m s residui z mod_aditivni.
# 2. Spočítejte průměrné residuum každého druhu. Použijte vzor níže;
#    aggregate() spočítá funkci FUN (zde průměr) pro veličinu vlevo od ~
#    zvlášť v každé skupině vpravo od ~.
# aggregate(
#   x = residuum_m ~ druh_stromu,
#   data = data_residua,
#   FUN = mean
# )
# 3. Pro každý druh nakreslete samostatný graf residuí (osa y) proti
#    průměru kmene (osa x). Řádky jednoho druhu vyberte podmínkou jako
#    v kostře grafu před U03.

# Vaše řešení:


# Očekávaný výsledek:
# Všechny tři průměry jsou prakticky nulové, ale v grafech může být přesto
# vidět systematický vzorec. Průměr residuí nenahradí kontrolu, jak
# residua závisí na průměru kmene.
#
# Nápověda 1:
# V průměru se mohou vyrušit kladná a záporná residua z různých částí
# grafu.
#
# Nápověda 2:
# Pro osu x i y použijte stejnou podmínku pro výběr druhu. Do každého
# grafu přidejte nulovou čáru pomocí abline(h = 0).
#
# Interpretace:
# Proč nulové průměrné residuum ve skupinách nedokazuje, že přímka vztah
# dobře vystihuje?

#----------------------------------------#
### Úloha navíc | L09-N16 -----
#----------------------------------------#

# Zadání:
# Prozkoumejte, jak spolehlivé jsou odhady mimo rozsah naměřených dat.
# 1. Podle vzoru před U03 vytvořte pomocí expand.grid() tabulku všech tří
#    druhů při průměrech 30 a 100 cm. Druh převeďte na faktor se stejnými
#    úrovněmi jako v data_stromy.
# 2. Z mod_aditivni získejte odhady střední výšky s 95% intervaly
#    spolehlivosti:
#    predict(object = ..., newdata = ..., interval = "confidence",
#            level = 0.95)
#    Výstup má tři sloupce: fit (odhad), lwr a upr (dolní a horní mez).
# 3. Pomocí range(x = ...) zjistěte nejmenší a největší naměřený průměr
#    kmene u každého druhu.

# Vaše řešení:


# Očekávaný výsledek:
# Výstup má šest řádků a tři sloupce. Průměr 100 cm leží mimo naměřený
# rozsah všech druhů a intervaly jsou tam širší než při 30 cm. Interval
# popisuje nejistotu střední výšky jen za předpokladu, že model platí.
#
# Nápověda 1:
# Interval spolehlivosti počítá s tím, že přímka platí i mimo data; to
# ale z dat ověřit nelze.
#
# Nápověda 2:
# Porovnejte oba průměry s maximem každého druhu. Interval pro střední
# výšku neříká, jak vysoké budou jednotlivé nové stromy.
#
# Interpretace:
# Proč ani úzký interval mimo naměřená data nepotvrzuje, že přímka tam
# platí?

#--------------------------------------------------#
## Přenos postupu a závěry -----
#--------------------------------------------------#

#----------------------------------------#
### Úloha navíc | L09-N17 -----
#----------------------------------------#

# Zadání:
# Zopakujte postup z hlavních úloh pro jinou odezvu: suchou hmotnost větví
# hmotnost_vetvi_kg (kg). Jedním pozorováním zůstává jeden strom.
# 1. Nakreslete graf hmotnosti větví (osa y) proti průměru kmene (osa x)
#    s druhy odlišenými barvou a tvarem.
# 2. Dřív, než začnete modely porovnávat, napište biologickou otázku a tři
#    představy o vztahu hmotnosti větví a průměru kmene (jako před U02).
# 3. Vytvořte modely mod_vetve_spolecny, mod_vetve_aditivni
#    a mod_vetve_interakce.

# Vaše řešení:


# Očekávaný výsledek:
# Tři různé biologické představy odpovídají třem vzorcům. Všechny modely
# použijí stejných 63 stromů a nepřepíšou modely výšky.
#
# Nápověda 1:
# Jiná odezva mění biologickou otázku, ne postup sestavení kandidátních
# modelů.
#
# Nápověda 2:
# Ve vzorcích z U02 změňte jen levou stranu. V grafu z U01 změňte hodnoty
# osy y a její popisek včetně jednotek.
#
# Interpretace:
# Co biologicky znamená stejný sklon pro hmotnost větví různých druhů?

#----------------------------------------#
### Úloha navíc | L09-N18 -----
#----------------------------------------#

# Zadání:
# Tato úloha navazuje na N17 a používá její tři modely mod_vetve_*.
# 1. Sestavte jejich srovnávací tabulku s n, k, R², adjustovaným R², AIC
#    a ΔAIC (jako v U06).
# 2. U modelu s nejnižším AIC nakreslete graf residuí proti odhadům, Q–Q
#    graf a graf Cookových vzdáleností (jako v U07).
# 3. Napište biologický závěr včetně omezení, která ukazuje diagnostika.

# Vaše řešení:


# Očekávaný výsledek:
# Modely mají k = 2, 4 a 6. Pořadí modelů zjistíte z nové tabulky;
# nepřebírejte závěr pro výšku. Závěr odliší pořadí modelů v této sadě
# od toho, jak dobře vybraný model vystihuje data a jak ho ovlivňují
# jednotlivé stromy.
#
# Nápověda 1:
# Stejný postup u jiné odezvy nemusí vést ke stejnému pořadí modelů ani
# ke stejně dobré shodě s daty.
#
# Nápověda 2:
# Použijte tabulku z U06 a diagnostické grafy z U07 s novými modely.
# ΔAIC počítejte jen z AIC modelů hmotnosti větví.
#
# Interpretace:
# Jak diagnostika mění sílu biologického závěru, i když má model nejnižší
# AIC?

#----------------------------------------#
### Úloha navíc | L09-N19 -----
#----------------------------------------#

# Zadání:
# Samostatně projděte celý postup U01–U08 pro plochu listů stromu
# plocha_listu_m2 (m²). Nepoužívejte objekty z N17 ani N18.
# 1. Napište biologickou otázku a tři představy o vztahu plochy listů
#    a průměru kmene.
# 2. Nakreslete tento vztah s druhy odlišenými barvou a tvarem.
# 3. Vytvořte tři modely mod_listy_*: společnou přímku, posun mezi druhy
#    a různé sklony. Ověřte, že používají stejné stromy.
# 4. Sestavte srovnávací tabulku a proveďte diagnostiku.
# 5. Napište obhajobu vybraného modelu i s jejími omezeními.

# Vaše řešení:


# Očekávaný výsledek:
# Tři biologicky zdůvodněné modely, srovnávací tabulka a tři diagnostické
# grafy. Závěr respektuje odezvu, její jednotky a omezení dat.
#
# Nápověda 1:
# Rozdělte práci na čtyři kroky: otázka, kandidátní modely, kontrola
# srovnatelnosti a obhajoba.
#
# Nápověda 2:
# V každém kroku zkontrolujte, zda jste všude změnili odezvu, popisky os
# a názvy objektů. ΔAIC počítejte jen z modelů plochy listů.
#
# Interpretace:
# Která část obhajoby potřebuje grafy, i když už máte hotovou srovnávací
# tabulku?

#----------------------------------------#
### Úloha navíc | L09-N20 -----
#----------------------------------------#

# Zadání:
# Následující shrnutí je záměrně chybné:
#
#   „Interakce je nejlepší, protože má nejvyšší R². Tím jsme dokázali,
#   že druh způsobuje změnu růstu. Model s nízkým AIC už není třeba
#   kontrolovat. Stromy s Cookovou vzdáleností nad 4/n jsou chybné
#   a automaticky je smažeme.“
#
# Opravte každou větu. U každé opravy uveďte konkrétní číslo
# z data_porovnani nebo pozorování z diagnostických grafů mod_aditivni.

# Vaše řešení:


# Očekávaný výsledek:
# Opravy se týkají volby metriky a složitosti modelu, pozorovací povahy
# dat, diagnostiky a rozdílu mezi vlivným a chybným stromem. Žádný řádek
# původních dat se nemaže.
#
# Nápověda 1:
# Každá věta tvrdí něco jiného: o pořadí modelů, o příčině, o tom, zda
# model sedí na data, a o kvalitě záznamů.
#
# Nápověda 2:
# Použijte adjustované R² a AIC z U06, oblouk v residuích z U07 a význam
# čáry 4/n jako podnětu k prohlédnutí stromu. Data nepocházejí z řízeného
# experimentu.
#
# Interpretace:
# Které opravy mění výběr modelu a které jen sílu závěru?

#----------------------------------------------------------#
# Ohlédnutí a vlastní kontrola -----
#----------------------------------------------------------#
# Zkuste bez kódu odpovědět na tyto otázky:
# 1. Proč sestavujeme biologické představy a modely dříve, než se podíváme
#    na srovnávací tabulku?
# 2. Proč model s nejvyšším R² nemusí mít nejnižší AIC?
# 3. Proč musí porovnávané modely používat stejné stromy a stejnou odezvu?
# 4. Co ukazuje oblouk v residuích a proč ho nevyřeší to, že model má
#    nejlepší pořadí mezi kandidáty?
# 5. Proč velká Cookova vzdálenost sama o sobě neopravňuje strom smazat?
# Pokud si nejste jistí, vraťte se k úlohám U02, U05–U06 a U07–U08.
