#プロジェクト名: las2kml

点群データの代表格である.lasをGoogle MapやGoogle Earthにアップロードする際に必要となる.kmlファイルに変換するためのコード。
(ただし本コードは.lasの中身の座標系がUTM54Nの場合を想定している。取得した.lasがその他の座標系の場合はスクリプトもしくは元データをCloudcompareなどでCSV化し適合させる必要がある。CSV化後の座標変換に関しては、別のプロジェクトにて記載する)

#実行環境

MATLAB R2023a (trial), LiDAR Toolbox, Mapping Toolbox

#実行結果

Figure1
![image](https://user-images.githubusercontent.com/79899518/237013283-3ae60534-3b74-4f6b-bbdd-66eb863b3943.png)

Figure2
![image](https://user-images.githubusercontent.com/79899518/237013408-56a4e65a-287d-4e8b-9cac-07a5000dd73e.png)

Figure3 (on the global map)
![image](https://user-images.githubusercontent.com/79899518/237013616-b23a48a9-52be-49f9-8cad-4249e83f8d3b.png)
