$fileDir = Split-Path -Parent $MyInvocation.MyCommand.Path
cd $fileDir
java '-Dtalend.component.manager.m2.repository=%cd%/../lib' '-Xms256M' '-Xmx1024M' -cp '.;../lib/routines.jar;../lib/log4j-slf4j-impl-2.12.1.jar;../lib/log4j-api-2.12.1.jar;../lib/log4j-core-2.12.1.jar;../lib/log4j-1.2-api-2.12.1.jar;../lib/commons-collections-3.2.2.jar;../lib/jboss-serialization.jar;../lib/mysql-connector-java-8.0.18.jar;../lib/advancedPersistentLookupLib-1.2.jar;../lib/jxl.jar;../lib/slf4j-api-1.7.25.jar;../lib/dom4j-2.1.1.jar;../lib/trove.jar;../lib/talendcsv.jar;../lib/crypto-utils.jar;../lib/talend_file_enhanced_20070724.jar;job03_organization_dim_0_1.jar;' etude_de_cas_talend.job03_organization_dim_0_1.Job03_Organization_Dim  --context=Default $args