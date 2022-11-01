-- MYSQL------------------------------------------------

------------ dimension tables -------------------------------------
CREATE table dim_ArrestPerp (
	ArrestKeySK int NOT NULL,
	AgeGroupSK int NOT NULL,
	SexSK int NOT NULL,
	RaceSK int NOT NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime DEFAULT current_timestamp NOT NULL,
	PRIMARY KEY (ArrestKeySK)
);

CREATE table dim_Date (
	DateSK int NOT NULL AUTO_INCREMENT,
	arrest_date datetime(3) not null,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime DEFAULT current_timestamp NOT NULL,
	PRIMARY KEY (DateSK)
);

CREATE table dim_PenalLaws (
	PenalLawSK int NOT NULL AUTO_INCREMENT,
	pd_cd int NULL,
	law_code varchar(30) null,
	law_cat_cd varchar(30) null,
	pd_desc varchar(60) NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime DEFAULT current_timestamp NOT NULL,
	PRIMARY KEY (PenalLawSK)
);

CREATE table dim_OffenseDescription (
	OffenseDescriptionSK int NOT NULL AUTO_INCREMENT,
	ky_cd int NULL,
	ofns_desc varchar(40) null,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime DEFAULT current_timestamp NOT NULL,
	PRIMARY KEY (OffenseDescriptionSK)
);

CREATE table dim_PDDetails (
	PDDetailsSK int NOT NULL AUTO_INCREMENT,
	arrest_precinct int not null,
	arrest_boro varchar(30) not null,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime DEFAULT current_timestamp NOT NULL,
	PRIMARY KEY (PDDetailsSK)
);

CREATE table dim_Jurisdiction (
	JurisdictionCodeSK int NOT NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime DEFAULT current_timestamp NOT NULL,
	PRIMARY KEY (JurisdictionCodeSK)
);

CREATE table dim_AgeGroup (
	AgeGroupSK int NOT NULL AUTO_INCREMENT,
	age_group varchar(30) null,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime DEFAULT current_timestamp NOT NULL,
	PRIMARY KEY (AgeGroupSK)
);

CREATE table dim_Sex (
	SexSK int NOT NULL AUTO_INCREMENT,
	perp_sex varchar(30) not null,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime DEFAULT current_timestamp NOT NULL,
	PRIMARY KEY (SexSK)
);

CREATE table dim_Race (
	RaceSK int NOT NULL AUTO_INCREMENT,
	perp_race varchar(30) not null,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime DEFAULT current_timestamp NOT NULL,
	PRIMARY KEY (RaceSK)
);

CREATE table dim_Location (
	LocationSK int NOT NULL AUTO_INCREMENT,
	latitude decimal(20,18) not null,
	longitude decimal(20,18) not null,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime DEFAULT current_timestamp NOT NULL,
	PRIMARY KEY (LocationSK)
);

----------- fact table -----------------------------------------------------

CREATE TABLE fct_NYPDArrests (
	ArrestKeySK int NOT NULL,
	DateSK int NOT NULL default -99,
	PenalLawSK int NOT NULL default -99,
	OffenseDescriptionSK int NOT NULL default -99,
	PDDetailsSK int NOT NULL default -99,
	JurisdictionCodeSK int NOT NULL default -99,
	LocationSK int NOT NULL default -99,

	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime DEFAULT current_timestamp NOT NULL,
	PRIMARY KEY (ArrestKeySK,DateSK,PenalLawSK,OffenseDescriptionSK,PDDetailsSK,JurisdictionCodeSK,LocationSK)
);

----------- staging table -----------------------------------------------------

-- stg_nypd_arrests 
-- drop table if exists stg_nypd_arrests;

CREATE TABLE stg_nypd_arrests (
	sk_arrest_key int not null,
	arrest_date datetime(3) not null,
	pd_cd int NULL,
	pd_desc varchar(60) NULL,
	ky_cd int NULL,
	ofns_desc varchar(40) null,
	law_code varchar(30) null,
	law_cat_cd varchar(30) null,
	arrest_boro varchar(30) not null,
	arrest_precinct int not null,
	jurisdiction_code int null,
	age_group varchar(30) null,
	perp_sex varchar(30) not null,
	perp_race varchar(30) not null,
	x_coord_cd decimal(20,2) not null,
	y_coord_cd decimal(20,2) not null,
	latitude decimal(20,18) not null,
	longitude decimal(20,18) not null,
	
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime DEFAULT current_timestamp NOT NULL,
	PRIMARY KEY (sk_arrest_key)
);

-- stg_nypd_arrests_year_to_date_df 
-- drop table if exists stg_nypd_arrests_year_to_date_df;

CREATE TABLE stg_nypd_arrests_year_to_date_df (
	sk_arrest_key int not null,
	arrest_date datetime(3) not null,
	pd_cd int NULL,
	pd_desc varchar(60) NULL,
	ky_cd int NULL,
	ofns_desc varchar(40) null,
	law_code varchar(30) null,
	law_cat_cd varchar(30) null,
	arrest_boro varchar(30) not null,
	arrest_precinct int not null,
	jurisdiction_code int null,
	age_group varchar(30) null,
	perp_sex varchar(30) not null,
	perp_race varchar(30) not null,
	x_coord_cd decimal(20,2) not null,
	y_coord_cd decimal(20,2) not null,
	latitude decimal(20,18) not null,
	longitude decimal(20,18) not null,
	
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime DEFAULT current_timestamp NOT NULL,
	PRIMARY KEY (sk_arrest_key)
);

-- stg_nypd_arrests_history 
-- drop table if exists stg_nypd_arrests_history;

CREATE TABLE stg_nypd_arrests_history (
	sk_arrest_key int not null,
	arrest_date datetime(3) not null,
	pd_cd int NULL,
	pd_desc varchar(60) NULL,
	ky_cd int NULL,
	ofns_desc varchar(40) null,
	law_code varchar(30) null,
	law_cat_cd varchar(30) null,
	arrest_boro varchar(30) not null,
	arrest_precinct int not null,
	jurisdiction_code int null,
	age_group varchar(30) null,
	perp_sex varchar(30) not null,
	perp_race varchar(30) not null,
	x_coord_cd decimal(20,2) not null,
	y_coord_cd decimal(20,2) not null,
	latitude decimal(20,18) not null,
	longitude decimal(20,18) not null,
	
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime DEFAULT current_timestamp NOT NULL,
	PRIMARY KEY (sk_arrest_key)
);