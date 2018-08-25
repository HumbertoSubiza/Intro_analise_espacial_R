# Análise e visualização de dados espaciais com R

### Walter Humberto Subiza Piña - 2018

walter.pina1954@gmail.com
 
Estes tutorias, de carater introdutorio, estao baseados principalmente nas bibliotecas `sf`, `raster` para analise espacial de dados georreferenciados e algumas especificas para manipulação e visualização desses dados. As _vignettes_ dos pacotes alem da documentacao mencionada no final de cada tutorial devem consultar-se para aprofundar nos temas expostos.

Os dados para reproduzir os exercicios devem ser baixados de _dropbox_:



---

## Indice

---

### **1a. Parte (mapas_com_R_01.rmd)**

#### 1. Introdução

Objetivo: apresentar algumas formas de tratar e visualizar os dados no _R_, considerando sua espacialidade.

Conceito de **feição** ou **_simple feature_**. Apresentação de pacotes `sf`, `raster` e `sp`.

---

#### 2. Objetos classe S-3 e S-4

  a- Definição
        
  b- Representação e geometria vetorial
  
  + Dimensão e coordenadas
      
  + organização das feições simples no `sf`
      
  + Métodos para cada classe
      
  + Tipos de geometria

  c- Dados matriciais ou raster
  
---

#### 3. Sistema Geodésico de Referência - SGR ( _CRS_)

 a- _CRS_ não projetado ou de coordenadas geográficas

 b- _CRS_ de coordenadas projetadas

  Tabelas de SGR no Brasil
  
     Exercício identificação de SGR

---

### **2a. Parte (mapas_com_R_02.rmd)**

#### 1. Leitura de arquivos vetoriais e raster

      Exercícios de identificação de tipo de geometria, SGR, etc
      
  . função <span style="color:red">`st_read()`:</span>
    
  a- Ponto
  
  b- Linha

  c- Poligono

  d- Multipoligono
  
  e- Raster com uma camada ou _layer_
  
  . função<span style="color:red"> `raster()`</span>
  
  f- raster Multi-camadas ou _multilayers_
  
  . função<span style="color:red"> `brick()`, `stack()`</span>
  
  g- Base de dados PostGis

---

#### 2. Manipulação de dados georreferenciados 

   a- Extração de metadados

  . funções <span style="color:red"> `extent(), ncell(), nlayers()`</span>
  
   b- Identificação ou definição de um _CRS_ em objetos georreferenciados

  . função <span style="color:red">`crs(..., asText = TRUE)`</span> para dados matriciais
  
  . função <span style="color:red"> `st_crs()`</span> para dados vetoriais
  
    Exercício definição do SGR de um arquivo vetorial
  
   c- Reprojetar ou transformar um objeto espacial
   
   . função<span style="color:red"> `sf::st_transform(“dados.shp”, crs)`</span>

   . função <span style="color:red">``raster::project_raster(“from.tif”, "to.tif", crs)``</span>
   
    Exercício transformação de SGR
   
   d- conversão de dataframe com coordenadas em objeto “sf” e viceversa
   
   . função<span style="color:red"> `sf::st_as_sf()`</span>

     Exercício conversão objeto dataframe em sf

---

### **3a. Parte (mapas_com_R_03.rmd)**

####  Visualização de dados georreferenciados

  1- Dados vetoriais
  
  + Quadrícula geográfica e projetada
  
  a - Função Base `plot()`
  
  + Cartogramas com a geometria dos objetos (`sfc`)
    
  + Cartogramas usando atributos (dataframe classe `sf`)
  
  b - `ggplot2`
  
  c - `tmap`
  
  2 - Dados matriciais
  
  a - `plot()` e `plotRGB()`
  
  b - Google Maps: `ggmap()` e `qmap()`

---


### **4a. Parte (mapas_com_R_04.rmd)**

#### 1. Análise espacial de dados vetoriais

   a- _Buffer_ : função <span style="color:red"> `st_buffer(), st_union()`</span>

   b- Áreas envolventes: funções <span style="color:red"> `st_bbox(), st_make_grid(), st_convex_hull()`</span>

   c- Cálculo de centroides: função <span style="color:red"> `st_centroid()`</span>.

     Exercício

  d- Área: função <span style="color:red">`st_area()`</span> (para dados tipo polígono ou multipolígonos)
  
  e- Distâncias: função <span style="color:red">`st_distance()`</span> (matriz de distâncias entre pontos)
  
  f- Comprimento de feições lineares: função <span style="color:red"> `st_lenght()`</span> (para dados tipo LINESTRING ou MULTILINESTRING)
  
  g - Adicionar dados georreferenciados e não georreferenciados: função <span style="color:red"> `merge()`</span>
  
  h- Simplificando poligonos: função <span style="color:red"> `st_simplify()`</span>
 
---

#### 2. Análisis espacial de dados matriciais ( _raster_) 

   a- reclassificação: função<span style="color:red"> `reclassify()`</span>

    Exercícios

   b- Leitura de valores: função <span style="color:red">`getValues()`</span>
   

   c- Mudar a resolução: função <span style="color:red">`aggregate()`</span>

     Exercício

   d- Gravar um arquivo raster: <span style="color:red">`writeRaster()`</span>
 
--- 

### Exercícios de aplicação

---
\
---

#### Análise espacial 01

Objetivo:

Determinar que ruas compõem o bairro de botafogo e estabelecer a que distância se encontram da UPA Botafogo.


 Insumos:
 
   -    - logradouros municipio RJ (eixo_logra.shp) - [Prefeitura de Rio de Janeiro](http://pgeo3.rio.rj.gov.br/arcgis/rest/services/Cartografia/Vias/MapServer/0)
   
   - bairros do RJ (Botafogo e Urca) (bairros_rj.shp) - Arquivo própio do autor, com limites de alguns bairros de RJ.
   
   - UPA de botafogo (upa_botafogo.shp) - Coordenadas aproximadas da UPA localizada na rua São Clemente do Bairro de Botafogo, RJ.

 Funções empregadas:
 
  - <span style="color:red">`st_read()`, `st_crs()`,`st_transform()`, `st_geometry()`, `st_intersection()`, `st_intersects()`, `st_contains()`, `st_distance()`</span>.

\
---
\

#### Análise espacial 02  

Objetivo:

Analisar o tipo e distribuição de nascimentos no município de RJ entre os anos 2010 e 2015

  Insumos:
  
   - Arquivo nv.csv extraído do [DATASUS](http://www2.datasus.gov.br/DATASUS) em novembro de 2017
   
   - Arquivo camada com os municípios do estado do Rio de Janeiro

Funções empregadas:
 
  - <span style="color:red">`read_csv()`,`st_read()`, `mutate()`, `merge()`, `readOGR()`, `plot()`, `tmap()`</span>.

\
---
\

#### Análise espacial 03

Objetivo:

Calcular a densidade populacional em 2015 para cada município do Brasil.

 Insumos:
 
   - Arquivo camada (.shp) com UF, região e municípios do Brasil (malha_mun_completa.shp)
   
   - populacão estimada por municipio para 2015 (IBGE) (mun_pop_2015.csv)

 Funções empregadas:
 
  - <span style="color:red">`st_read()`, `st_crs()`,`st_area()`, `drop_units()`, `cbind()`, `filter()`, `st_contains()`, `select()`, `left_join()`, `mutate()`, `read_csv()`</span>.

  
\
---
\

#### Análise espacial 04 

Objetivo:

Efetuar operações  de análise espacial com dados raster

 Insumos:
 
   - Arquivo com modelo de elevações da zona do município de Nova Iguaçú
   
   - Arquivo camada com duas áreas de APA do município de Nova Iguaçú 
   
 Funções empregadas:
 
  - <span style="color:red">`raster()`, `extent()`,`crop()`, `st_read()`, `st_transform()`, `st_geometry()`, `mask()`, `extract()`</span>.

\
---
\

#### Análise espacial 05

 Objetivo:

 Determinar as ruas do municipio de Rio de Janeiro que cruzam com rodovias estaduais ou federais  (localização e número), em um entorno de 200 m das mesmas. A análise final será feita em SGR SIRGAS2000, coordenadas UTM fuso 23 (EPSG = 31983)

 Insumos:
 
    - Rodovias do Brasil levantadas peloa DNIT (rodovias_dnit.shp) - [DNIT](http://www.dnit.gov.br/mapas-multimodais/shapefiles)
   
   - logradouros municipio RJ (eixo_logra.shp) - [Prefeitura de Rio de Janeiro](http://pgeo3.rio.rj.gov.br/arcgis/rest/services/Cartografia/Vias/MapServer/0)

   - malha municipal do Brasil (malha_municipal_brasil.shp) - [IBGE- Estrutura Territorial](https://www.ibge.gov.br/geociencias-novoportal/organizacao-do-territorio/estrutura-territorial/)
   
  - Unidades da federação (Brasil_UF_2013.shp) - [IBGE- Estrutura Territorial](https://www.ibge.gov.br/geociencias-novoportal/organizacao-do-territorio/estrutura-territorial/)


 Funções empregadas:
 
  - <span style="color:red">`st_read()`, `st_intersects()`,`st_union()`, `st_buffer()`, `st_intersection()`, `st_transform()`, `st_geometry()`</span>.
  
  - <span style="color:red">`plot()`, `filter()`, `select()`, `str_detect()`, `unique()`, `fct_count()`</span>.

\
---
\

CREDITOS: 

  + IBGE - Nocoes Basicas de Cartografia - Manuais Tecnicos em Geociencias, 1999.
  
  +  Edzer Pebesma (2018). sf: Simple Features for R. R package version 0.6-3.
  https://CRAN.R-project.org/package=sf

  +  Robert J. Hijmans (2017). raster: Geographic Data Analysis and Modeling. R package version
  2.6-7. https://CRAN.R-project.org/package=raster

  +   Roger Bivand, Tim Keitt and Barry Rowlingson (2018). rgdal: Bindings for the 'Geospatial' Data
  Abstraction Library. R package version 1.3-4. https://CRAN.R-project.org/package=rgdal
 
  + [EPSG](https://www.epsg-registry.org/) 
  
  +   Hadley Wickham (2017). tidyverse: Easily Install and Load the 'Tidyverse'. R package version
  1.2.1. https://CRAN.R-project.org/package=tidyverse

  + Fonte dos dados: o próprio autor do tutorial ou extraídos do portal IBGE: <https://www.ibge.gov.br/>, e ou mencionados nos próprios exercícios de aplicação.
  
---

