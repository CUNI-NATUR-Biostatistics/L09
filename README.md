# L09 — Porovnání kandidátních modelů

**R², adjustované R² a AIC při volbě modelu**

Tento repozitář obsahuje devátou lekci kurzu [Biostatistika a plánování ekologických pokusů (MB120P163)](https://cuni-natur-biostatistics.github.io/) vyučovaného na Přírodovědecké fakultě Univerzity Karlovy.

Úplný přehled kurzu, rozvrh, pravidla hodnocení a materiály ostatních lekcí najdete na [veřejném HUBu kurzu](https://cuni-natur-biostatistics.github.io/).

## O této lekci

Jak složitý model potřebujeme k popisu vztahu mezi průměrem kmene a výškou stromu u tří druhů jehličnanů? Lekce navazuje na interpretaci modelů s více prediktory a interakcemi a přesouvá pozornost od jednoho modelu k obhajitelnému porovnání několika předem formulovaných kandidátů.

Výuková data obsahují měření 63 stromů tří druhů jehličnanů. Kandidátní modely postupně vyjadřují tři biologické představy: společný vztah mezi průměrem kmene a výškou, rozdílnou typickou výšku jednotlivých druhů a druhově specifické sklony tohoto vztahu.

Studenti porovnají R², adjustované R² a AIC, ale konečné rozhodnutí neopřou o jediné číslo. Zohlední také biologickou otázku, složitost, diagnostiku a interpretovatelnost modelu.

Schopnost obhájit malou sadu kandidátních modelů je důležitá pro transparentní analýzu biologických dat a připravuje půdu pro pozdější práci s nelinearitou a složitější strukturou dat.

## Výsledky učení

Po prostudování této lekce dokážete:

- vysvětlit, proč nejvyšší R² automaticky neznamená nejlepší model;
- rozlišit účel R², adjustovaného R² a AIC;
- sestavit malou sadu biologicky zdůvodněných kandidátních modelů;
- obhájit volbu modelu s ohledem na otázku, složitost, diagnostiku a interpretovatelnost.

## Materiály pro studenty

Následující odkazy vedou vždy na nejnovější schválené vydání L09. Rozpracovaná verze ve větvi `main` může být novější, ale není určena jako závazná studijní verze.

| Materiál | Online verze | PDF |
| --- | --- | --- |
| Skripta | [Číst online](https://cuni-natur-biostatistics.github.io/L09/current/learning/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L09/current/learning/skripta.pdf) |
| Prezentace | [Otevřít slidy](https://cuni-natur-biostatistics.github.io/L09/current/presentation/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L09/current/presentation/presentation.pdf) |

Dosavadní stabilní vydání obsahuje skripta, prezentaci a výuková data. Nový [Skript ke cvičení (návrh)](Exercises/cviceni.R) obsahuje osm hlavních úloh a dvacet dobrovolných úloh navíc na stejných 63 stromech. Je připraven pro 120minutové praktikum; hlavní trasa počítá se 70 minutami samostatné práce, dobrovolná banka slouží i k pozdějšímu procvičování. Ke spuštění stačí základní R a CSV, bez dodatečných balíčků.

Cvičení čeká na výslovné schválení hotového skriptu a samostatné vydání. Pro kontrolu návrhu stáhněte skript z této větve a [CSV dat](data/allometrie_stromu.csv), vytvořte složku `L09_praktikum` s podsložkou `data` a postupujte podle úvodu skriptu. Při otevření zdrojového souboru na GitHubu použijte tlačítko **Download raw file**, které stáhne obsah souboru. Po vydání bude skript dostupný na stabilní cestě [`/L09/current/code/cviceni.R`](https://cuni-natur-biostatistics.github.io/L09/current/code/cviceni.R); tato cesta v dosavadním vydání ještě není dostupná. [Stabilní CSV](https://cuni-natur-biostatistics.github.io/L09/current/data/allometrie_stromu.csv) je součástí již vydaných materiálů.

- [HUB kurzu](https://cuni-natur-biostatistics.github.io/) je hlavní vstup ke všem veřejným studijním materiálům.
- [Moodle kurzu](https://dl2.cuni.cz/course/view.php?id=106) slouží zapsaným studentům pro oznámení, testy, zadání, odevzdávání a individuální výsledky.

## Pro vyučující a správce

### Zdrojové a vyrenderované soubory

- `Learning_materials/skripta.qmd` je zdroj skript; výsledky jsou `Learning_materials/skripta.html` a `Learning_materials/skripta.pdf`.
- `Presentation/presentation.qmd` je zdroj slidů; výsledky jsou `Presentation/presentation.html` a `Presentation/presentation.pdf`.
- `Exercises/cviceni.R` je úplný pracovní list s hlavní trasou U01–U08 a bankou N01–N20; řešení se nepublikují. Manifest připravuje jeho zahrnutí do následujícího vydání, schválení hotového cvičení je dosud otevřené.
- `data/` obsahuje datové soubory specifické pro tuto lekci.
- `R/` obsahuje podporované renderovací a tematické nástroje.
- `theme/` obsahuje synchronizovanou lokální kopii společné vizuální identity kurzu.
- `pollslive/` obsahuje neaktivní šablonu pro pozdější zapojení schváleného opakovacího kvízu; bez souborů `pollslive/config.json` a `pollslive/quiz.json` nijak nemění render lekce.
- `Workflow/` obsahuje záznamy rozhodnutí, kontrol a schválení během přípravy lekce; není součástí veřejného release balíčku.

[Blueprint cvičení](Workflow/records/2026-10-08-exercise-blueprint.md) zaznamenává návaznosti, časový plán, ověření a stav nezávislé i lidské kontroly. Nové veřejné vydání vyžaduje schválené cvičení a schválený titulní obrázek vytvořený ze skutečných obrázků a grafů lekce; tento obrázek na titulním slidu L09 zatím chybí.

### Reprodukovatelné prostředí

Repozitář používá `renv`. Po klonování otevřete `L09.Rproj` a v čerstvé R relaci spusťte:

```r
renv::restore()
renv::status()
```

Kompletní lokální render spustíte podporovaným wrapperem:

```r
source("R/render_all.R")
```

Samostatně lze použít `R/render_skripta.R` nebo `R/render_presentation.R`. Přímé volání `quarto render` obchází synchronizaci sdíleného tématu a nemá se používat pro release render.

### Publikování

`website-release.yml` je explicitní seznam souborů povolených ve veřejném balíčku. Větev `main` vytváří veřejný náhled, zatímco stabilní tag `L09-vMAJOR.MINOR.PATCH-YYYYMMDD` vytváří neměnné vydání a aktualizuje cestu `/L09/current/`. Před prvním vydáním nahraďte v manifestu i v tomto README všechny zástupné údaje skutečnými hodnotami.

Podrobný publikační postup je v [`WEBSITE_RELEASES.md`](WEBSITE_RELEASES.md). Postup tvorby a kontroly lekce je v [`Workflow/README.md`](Workflow/README.md).

Před vydáním je nutné zkontrolovat vyrenderované HTML a PDF, úplnost manifestu, provenanci a podmínky použití dat a médií a nepřítomnost neveřejných informací v celém repozitáři.

## Licence

Původní výukový obsah je licencován pod CC BY 4.0 a software pod licencí MIT. Přesné vymezení, doporučená citace a výjimky pro převzatá data, média, fonty, loga a další položky jsou v [`LICENSE.md`](LICENSE.md).
