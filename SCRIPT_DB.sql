CREATE TABLE DESENV.TIPOS_ATENCAO_FARM
(
    ID_TIPOS_ATENCAO_FARM   INT  NOT NULL AUTO_INCREMENT,
    DESC_TIPO_ATENCAO_FARM  VARCHAR(60) NOT NULL,
    VALOR_UNITARIO          NUMERIC(10,2),
    PRIMARY KEY (ID_TIPOS_ATENCAO_FARM)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE DESENV.SERVICOS_FARM
(
    ID_SERVICOS_FARM     INT  NOT NULL AUTO_INCREMENT,
    OBSERVACOES          VARCHAR(500) NULL,
    DATA_HORA            DATETIME,
    NOME_FARMACEUTICO    VARCHAR(50),
    NOME_PACIENTE        VARCHAR(50),
    VALOR_TOTAL_SERVICOS NUMERIC(10,2),
	PRIMARY KEY (ID_SERVICOS_FARM)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE DESENV.SERVICOS_FARM_TIPOS
(
	ID_SERVICOS_FARM_TIPOS INT NOT NULL AUTO_INCREMENT,
    ID_FR_TIPOS_ATENCAO_FARM INT NOT NULL,
    ID_FR_SERVICOS_FARM INT NOT NULL,
    PRIMARY KEY (ID_SERVICOS_FARM_TIPOS),
    FOREIGN KEY (ID_FR_TIPOS_ATENCAO_FARM) REFERENCES TIPOS_ATENCAO_FARM(ID_TIPOS_ATENCAO_FARM),
    FOREIGN KEY (ID_FR_SERVICOS_FARM) REFERENCES SERVICOS_FARM(ID_SERVICOS_FARM) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
