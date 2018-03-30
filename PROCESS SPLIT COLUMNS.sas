 
/*author: Jing Hu*/
/*************************PROGRAM BEGIN ********************************************/

/*STEP 1. count the maxium IDs*/
proc sql noprint;
select  max(count(issuer_id,","))+1 into :maxelements from list ; 
quit;
%put &maxelements.
;
quit;

/*STEP 2. split the issuer ID delimitered by ","*/
data list_1 (drop=i);
set list;
array parsed_id $6  new_id1-new_id%eval(&maxelements.);
do i=1 to &maxelements;
parsed_id{i}= scan(issuer_id,i,',');
end;
run;

/*STEP 3. list the issuer ID with corresponding issuer name, url and contact email*/
PROC SORT
	DATA=WORK.LIST_1	;
	BY Issuer_Name URL_for_index_JSON_File Technical_Contact_Email;
RUN;
PROC TRANSPOSE DATA=WORK.LIST_1 	OUT=WORK.TRNSTRANSPOSED  	PREFIX=Column;
	BY Issuer_Name URL_for_index_JSON_File Technical_Contact_Email;
	VAR new_id1 new_id2 new_id3 new_id4 new_id5 new_id6 new_id7 new_id8 new_id9 new_id10 new_id11 new_id12 new_id13 new_id14 new_id15 new_id16 new_id17 new_id18 new_id19 new_id20 new_id21 new_id22 new_id23 new_id24 new_id25 new_id26 new_id27 new_id28
	  new_id29 new_id30 new_id31 new_id32 new_id33 new_id34 new_id35 new_id36 ;
RUN; QUIT;


/****************       PROGRAM END     ***********************************************/
