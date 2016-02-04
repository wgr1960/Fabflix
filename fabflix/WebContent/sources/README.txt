{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf110
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red16\green19\blue26;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 Compile Java Sources\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
cd src\
\
\pard\pardeftab720\sl358\partightenfactor0

\fs26 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 javac -classpath "../fabflix/WebContent/WEB-INF/lib\
/servlet-api.jar:../fabflix/WebContent/WEB-INF/lib\
/mysql-connector-java-5.0.8-bin.jar" *.java\
\
Take all the generated class files, and copy them into /fabflix/build/classes.\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\fs24 \cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
\
Generate Class Files\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
Finally, go into the fabflix and execute this command:\
jar cvf ../fabflix.war \
\
You can now put the fabflix.war in the webapps folder in tomcat7.\
\
Access Reports\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
- For Connection Pooling add /reports/connection_pooling.html to link\
- For Like Predicates add /reports/like-preciate.jsp to link}