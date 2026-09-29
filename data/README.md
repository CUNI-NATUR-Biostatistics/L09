# Výuková data L09

Soubor `allometrie_stromu.csv` obsahuje měření 63 stromů tří druhů jehličnanů. Jeden řádek představuje jeden strom. Tabulka zahrnuje druh, průměr kmene ve výšce 1,3 m, výšku stromu, celkovou plochu listů a suchou hmotnost větví.

Data pocházejí z datasetu `allometry` v balíčku [`lgrdata` 0.1.1](https://cran.r-project.org/package=lgrdata). Dokumentace připisuje původní měření Johnu Marshallovi z University of Idaho. Balíček a jeho data jsou zveřejněny pod licencí [CC0](https://creativecommons.org/publicdomain/zero/1.0/).

Reprodukovatelnou přípravu z připnutého zdrojového balíčku CRAN provádí skript `R/prepare_allometry_data.R`. Skript pouze nahrazuje třípísmenné druhové kódy vědeckými názvy a převádí názvy proměnných do češtiny; řádky ani naměřené hodnoty nefiltruje a nemění.

SHA-256 souboru `allometrie_stromu.csv`: `62b9f39eabfe8622a97a8791ee3e5c85c2d0f81c65ea85ca5be3b87a68477043`.

Původní data mají vlastní podmínky CC0; nevztahuje se na ně licence původního výukového textu v kořenovém `LICENSE.md`.
