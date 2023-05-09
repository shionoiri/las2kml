clear;clc;close all
% las/lazファイルを読み込むためのlasFileReader objectを作成する
lasReader = lasFileReader("C:\Users\Kawam\Desktop\Takaya\Osarizawa\Normalcompleted.las");
% las/lazファイルの、xyzおよび色情報を読み込み
ptCloud = readPointCloud(lasReader);
% 可視化
figure('Visible','on');pcshow(ptCloud)
% projcrsオブジェクトを作成する
utm54N = projcrs(32654);
% 確認のため、CRSを表示
utm54N.GeographicCRS.Name

[lat,lon] = projinv(utm54N,ptCloud.Location(:,1),ptCloud.Location(:,2));
figure; geoplot(lat,lon)
% hold on;geobasemap('streets')
hold on;geobasemap('topographic')
% 25点のうち1点のみを表示する。重くなってしまうため。
mskip = 1:50:length(lat);
% 3Dで可視化するための図を用意する
uif = uifigure;
g = geoglobe(uif);
% プロット
geoplot3(g,lat,lon,ptCloud.Location(:,3)-mean(ptCloud.Location(:,3)),'r','MarkerSize',2,'Marker','o','HeightReference','terrain','LineStyle','none','MarkerIndices',mskip)

% KMLファイルのファイル名を設定
kmlFileName = 'PointCloud2.kml';

% 高度データを計算
altitude = ptCloud.Location(:,3) - mean(ptCloud.Location(:,3));

% KMLファイルに点群データを書き込む
kmlwrite(kmlFileName, lat(mskip), lon(mskip), altitude(mskip), 'Name', 'Point Cloud');

% KMLファイル名（既に作成済み）
kmlFileName = 'PointCloud2.kml';

% 新しいKMZファイル名を設定
kmzFileName = 'PointCloud2.kmz';

% KMLファイルを圧縮して、KMZファイルを作成
zip(kmzFileName, kmlFileName);