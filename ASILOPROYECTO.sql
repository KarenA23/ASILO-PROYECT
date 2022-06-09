/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     08/06/2022 23:02:56                          */
/*==============================================================*/


drop index RELATIONSHIP_1_FK;

drop index ANCIANO_PK;

drop table ANCIANO;

drop index ASILO_PK;

drop table ASILO;

drop index RELATIONSHIP_2_FK;

drop index CANTON_PK;

drop table CANTON;

drop index RELATIONSHIP_18_FK;

drop index RELATIONSHIP_11_FK;

drop index CERTIFICADO_PK;

drop table CERTIFICADO;

drop index RELATIONSHIP_16_FK;

drop index RELATIONSHIP_8_FK;

drop index CONSULTA_MEDICA_PK;

drop table CONSULTA_MEDICA;

drop index RELATIONSHIP_3_FK;

drop index FAMILIAR_PK;

drop table FAMILIAR;

drop index RELATIONSHIP_17_FK;

drop index RELATIONSHIP_6_FK;

drop index INCIDENTE_PK;

drop table INCIDENTE;

drop index RELATIONSHIP_14_FK;

drop index RELATIONSHIP_13_FK;

drop index PAGO_PK;

drop table PAGO;

drop index RELATIONSHIP_10_FK;

drop index PERSONAL_ADMINISTRATIVO_PK;

drop table PERSONAL_ADMINISTRATIVO;

drop index RELATIONSHIP_9_FK;

drop index PERSONAL_SALUD_PK;

drop table PERSONAL_SALUD;

drop index RELATIONSHIP_15_FK;

drop index RELATIONSHIP_12_FK;

drop index RELATIONSHIP_7_FK;

drop index SERVICIO_PK;

drop table SERVICIO;

drop index TIPO_SERVICIO_PK;

drop table TIPO_SERVICIO;

/*==============================================================*/
/* Table: ANCIANO                                               */
/*==============================================================*/
create table ANCIANO (
   ID_ANCIANO           INT4                 not null,
   ID_ASILO             INT4                 not null,
   NOMBRE_ANCIANO       VARCHAR(30)          null,
   APELLIDO_ANCIANO     VARCHAR(30)          null,
   CEDULA_ANCIANO       VARCHAR(10)          null,
   FECHANACIMIENTO_ANCIANO DATE                 null,
   GENERO_ANCIANO       VARCHAR(10)          null,
   ESTADOCIVIL_ANCIANO  VARCHAR(20)          null,
   TIPO_DE_SANGRE_ANCIANO VARCHAR(3)           null,
   FECHA_LLEGADA        DATE                 null,
   CONDICION_SALUD      VARCHAR(100)         null,
   BOVEDA_PERTENECIENTE VARCHAR(5)           null,
   constraint PK_ANCIANO primary key (ID_ANCIANO)
);

/*==============================================================*/
/* Index: ANCIANO_PK                                            */
/*==============================================================*/
create unique index ANCIANO_PK on ANCIANO (
ID_ANCIANO
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on ANCIANO (
ID_ASILO
);

/*==============================================================*/
/* Table: ASILO                                                 */
/*==============================================================*/
create table ASILO (
   ID_ASILO             INT4                 not null,
   NOMBRE_ASILO         VARCHAR(30)          null,
   CIUDAD_ASILO         VARCHAR(30)          null,
   CALLE_ASILO          VARCHAR(20)          null,
   TELEFONO_ASILO       VARCHAR(10)          null,
   CANTON_ASILO         VARCHAR(20)          null,
   constraint PK_ASILO primary key (ID_ASILO)
);

/*==============================================================*/
/* Index: ASILO_PK                                              */
/*==============================================================*/
create unique index ASILO_PK on ASILO (
ID_ASILO
);

/*==============================================================*/
/* Table: CANTON                                                */
/*==============================================================*/
create table CANTON (
   ID_CANTON            INT4                 not null,
   ID_ASILO             INT4                 not null,
   NOMBRE_CANTON        VARCHAR(30)          null,
   DESCRIPCION_CANTON   VARCHAR(100)         null,
   constraint PK_CANTON primary key (ID_CANTON)
);

/*==============================================================*/
/* Index: CANTON_PK                                             */
/*==============================================================*/
create unique index CANTON_PK on CANTON (
ID_CANTON
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on CANTON (
ID_ASILO
);

/*==============================================================*/
/* Table: CERTIFICADO                                           */
/*==============================================================*/
create table CERTIFICADO (
   ID_CERTIFICADO       INT4                 not null,
   ID_ASILO             INT4                 not null,
   ID_ANCIANO           INT4                 not null,
   FECHASOLICITADA_CERTIFICADO DATE                 null,
   FECHAEMITIDA_CERTIFICADO DATE                 null,
   DESCRIPCION_CERTIFICADO VARCHAR(200)         null,
   constraint PK_CERTIFICADO primary key (ID_CERTIFICADO)
);

/*==============================================================*/
/* Index: CERTIFICADO_PK                                        */
/*==============================================================*/
create unique index CERTIFICADO_PK on CERTIFICADO (
ID_CERTIFICADO
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on CERTIFICADO (
ID_ASILO
);

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_18_FK on CERTIFICADO (
ID_ANCIANO
);

/*==============================================================*/
/* Table: CONSULTA_MEDICA                                       */
/*==============================================================*/
create table CONSULTA_MEDICA (
   ID_CONSULTA          INT4                 not null,
   ID_PERSONAL_SALUD    INT4                 not null,
   ID_ANCIANO           INT4                 not null,
   DESCRIPCION_CONSULTA VARCHAR(100)         null,
   ENTRADA_CONSULTA     DATE                 null,
   SALIDA_CONSULTA      DATE                 null,
   constraint PK_CONSULTA_MEDICA primary key (ID_CONSULTA)
);

/*==============================================================*/
/* Index: CONSULTA_MEDICA_PK                                    */
/*==============================================================*/
create unique index CONSULTA_MEDICA_PK on CONSULTA_MEDICA (
ID_CONSULTA
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on CONSULTA_MEDICA (
ID_PERSONAL_SALUD
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_16_FK on CONSULTA_MEDICA (
ID_ANCIANO
);

/*==============================================================*/
/* Table: FAMILIAR                                              */
/*==============================================================*/
create table FAMILIAR (
   ID_FAMILIAR          INT4                 not null,
   ID_ANCIANO           INT4                 not null,
   NOMBRE_FAMILIAR      VARCHAR(30)          null,
   APELLIDO_FAMILIAR    VARCHAR(30)          null,
   CEDULA_FAMILIAR      VARCHAR(10)          null,
   TELEFONO_FAMILIAR    VARCHAR(10)          null,
   DIRECCION_FAMILIAR   VARCHAR(30)          null,
   CORREO_FAMILIAR      VARCHAR(50)          null,
   constraint PK_FAMILIAR primary key (ID_FAMILIAR)
);

/*==============================================================*/
/* Index: FAMILIAR_PK                                           */
/*==============================================================*/
create unique index FAMILIAR_PK on FAMILIAR (
ID_FAMILIAR
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on FAMILIAR (
ID_ANCIANO
);

/*==============================================================*/
/* Table: INCIDENTE                                             */
/*==============================================================*/
create table INCIDENTE (
   ID_INCIDENTE         INT4                 not null,
   ID_ASILO             INT4                 not null,
   ID_ANCIANO           INT4                 not null,
   FECHA_INCIDENTE      DATE                 null,
   HORA_INCIDENTE       TIME                 null,
   DESCRIPCION_INCIDENTE VARCHAR(200)         null,
   constraint PK_INCIDENTE primary key (ID_INCIDENTE)
);

/*==============================================================*/
/* Index: INCIDENTE_PK                                          */
/*==============================================================*/
create unique index INCIDENTE_PK on INCIDENTE (
ID_INCIDENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on INCIDENTE (
ID_ASILO
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_17_FK on INCIDENTE (
ID_ANCIANO
);

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   ID_PAGO              INT4                 not null,
   ID_ANCIANO           INT4                 not null,
   ID_FAMILIAR          INT4                 not null,
   FECHA_PAGO           DATE                 null,
   VALOR_PAGO           NUMERIC(10)          null,
   PAGO_TARJETA         VARCHAR(20)          null,
   PAGO_EFECTIVO        VARCHAR(20)          null,
   FUENTE_PAGO          VARCHAR(50)          null,
   constraint PK_PAGO primary key (ID_PAGO)
);

/*==============================================================*/
/* Index: PAGO_PK                                               */
/*==============================================================*/
create unique index PAGO_PK on PAGO (
ID_PAGO
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on PAGO (
ID_ANCIANO
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_14_FK on PAGO (
ID_FAMILIAR
);

/*==============================================================*/
/* Table: PERSONAL_ADMINISTRATIVO                               */
/*==============================================================*/
create table PERSONAL_ADMINISTRATIVO (
   ID_PERSONAL_ADM      INT4                 not null,
   ID_ASILO             INT4                 not null,
   NOMBRE_PERSONAL_ADM  VARCHAR(30)          null,
   APELLIDO_PERSONAL_ADM VARCHAR(30)          null,
   CEDULA_PERSONAL_ADM  VARCHAR(10)          null,
   TELEFONO_PERSONAL_ADM VARCHAR(10)          null,
   CARGO_PERSONAL_ADM   VARCHAR(30)          null,
   ENTRADA_PERSONAL_ADM DATE                 null,
   CORREO_PERSONAL_ADM  VARCHAR(50)          null,
   constraint PK_PERSONAL_ADMINISTRATIVO primary key (ID_PERSONAL_ADM)
);

/*==============================================================*/
/* Index: PERSONAL_ADMINISTRATIVO_PK                            */
/*==============================================================*/
create unique index PERSONAL_ADMINISTRATIVO_PK on PERSONAL_ADMINISTRATIVO (
ID_PERSONAL_ADM
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on PERSONAL_ADMINISTRATIVO (
ID_ASILO
);

/*==============================================================*/
/* Table: PERSONAL_SALUD                                        */
/*==============================================================*/
create table PERSONAL_SALUD (
   ID_PERSONAL_SALUD    INT4                 not null,
   ID_ASILO             INT4                 not null,
   NOMBRE_PERSONAL_SALUD VARCHAR(30)          null,
   APELLIDO_PERSONAL_SALUD VARCHAR(30)          null,
   CEDULA_PERSONAL_SALUD VARCHAR(10)          null,
   TELEFONO_PERSONAL_SALUD VARCHAR(10)          null,
   ESPECIALIDAD_PERSONAL_SALUD VARCHAR(30)          null,
   ENTRADA_PERSONAL_SALUD DATE                 null,
   CORREO_PERSONAL_SALUD VARCHAR(50)          null,
   constraint PK_PERSONAL_SALUD primary key (ID_PERSONAL_SALUD)
);

/*==============================================================*/
/* Index: PERSONAL_SALUD_PK                                     */
/*==============================================================*/
create unique index PERSONAL_SALUD_PK on PERSONAL_SALUD (
ID_PERSONAL_SALUD
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on PERSONAL_SALUD (
ID_ASILO
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          INT4                 not null,
   ID_ANCIANO           INT4                 not null,
   ID_ASILO             INT4                 not null,
   ID_TIPOSERVICIO      INT4                 not null,
   NOMBRE_SERVICIO      VARCHAR(30)          null,
   DESCRIPCION_SERVICIO VARCHAR(50)          null,
   COSTO_SERVICIO       NUMERIC(5)           null,
   FRECUENCIASEMANAL_SERVICIO VARCHAR(20)          null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);

/*==============================================================*/
/* Index: SERVICIO_PK                                           */
/*==============================================================*/
create unique index SERVICIO_PK on SERVICIO (
ID_SERVICIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on SERVICIO (
ID_ANCIANO
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on SERVICIO (
ID_ASILO
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_15_FK on SERVICIO (
ID_TIPOSERVICIO
);

/*==============================================================*/
/* Table: TIPO_SERVICIO                                         */
/*==============================================================*/
create table TIPO_SERVICIO (
   ID_TIPOSERVICIO      INT4                 not null,
   BASICO_TIPOSERVICIO  VARCHAR(20)          null,
   MEDIO_TIPOSERVICIO   VARCHAR(20)          null,
   AVANZADO_TIPOSERVICIO VARCHAR(20)          null,
   constraint PK_TIPO_SERVICIO primary key (ID_TIPOSERVICIO)
);

/*==============================================================*/
/* Index: TIPO_SERVICIO_PK                                      */
/*==============================================================*/
create unique index TIPO_SERVICIO_PK on TIPO_SERVICIO (
ID_TIPOSERVICIO
);

alter table ANCIANO
   add constraint FK_ANCIANO_RELATIONS_ASILO foreign key (ID_ASILO)
      references ASILO (ID_ASILO)
      on delete restrict on update restrict;

alter table CANTON
   add constraint FK_CANTON_RELATIONS_ASILO foreign key (ID_ASILO)
      references ASILO (ID_ASILO)
      on delete restrict on update restrict;

alter table CERTIFICADO
   add constraint FK_CERTIFIC_RELATIONS_ASILO foreign key (ID_ASILO)
      references ASILO (ID_ASILO)
      on delete restrict on update restrict;

alter table CERTIFICADO
   add constraint FK_CERTIFIC_RELATIONS_ANCIANO foreign key (ID_ANCIANO)
      references ANCIANO (ID_ANCIANO)
      on delete restrict on update restrict;

alter table CONSULTA_MEDICA
   add constraint FK_CONSULTA_RELATIONS_ANCIANO foreign key (ID_ANCIANO)
      references ANCIANO (ID_ANCIANO)
      on delete restrict on update restrict;

alter table CONSULTA_MEDICA
   add constraint FK_CONSULTA_RELATIONS_PERSONAL foreign key (ID_PERSONAL_SALUD)
      references PERSONAL_SALUD (ID_PERSONAL_SALUD)
      on delete restrict on update restrict;

alter table FAMILIAR
   add constraint FK_FAMILIAR_RELATIONS_ANCIANO foreign key (ID_ANCIANO)
      references ANCIANO (ID_ANCIANO)
      on delete restrict on update restrict;

alter table INCIDENTE
   add constraint FK_INCIDENT_RELATIONS_ANCIANO foreign key (ID_ANCIANO)
      references ANCIANO (ID_ANCIANO)
      on delete restrict on update restrict;

alter table INCIDENTE
   add constraint FK_INCIDENT_RELATIONS_ASILO foreign key (ID_ASILO)
      references ASILO (ID_ASILO)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_RELATIONS_ANCIANO foreign key (ID_ANCIANO)
      references ANCIANO (ID_ANCIANO)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_RELATIONS_FAMILIAR foreign key (ID_FAMILIAR)
      references FAMILIAR (ID_FAMILIAR)
      on delete restrict on update restrict;

alter table PERSONAL_ADMINISTRATIVO
   add constraint FK_PERSONAL_RELATIONS_ASILO foreign key (ID_ASILO)
      references ASILO (ID_ASILO)
      on delete restrict on update restrict;

alter table PERSONAL_SALUD
   add constraint FK_PERSONAL_RELATIONS_ASILO foreign key (ID_ASILO)
      references ASILO (ID_ASILO)
      on delete restrict on update restrict;

alter table SERVICIO
   add constraint FK_SERVICIO_RELATIONS_ASILO foreign key (ID_ASILO)
      references ASILO (ID_ASILO)
      on delete restrict on update restrict;

alter table SERVICIO
   add constraint FK_SERVICIO_RELATIONS_TIPO_SER foreign key (ID_TIPOSERVICIO)
      references TIPO_SERVICIO (ID_TIPOSERVICIO)
      on delete restrict on update restrict;

alter table SERVICIO
   add constraint FK_SERVICIO_RELATIONS_ANCIANO foreign key (ID_ANCIANO)
      references ANCIANO (ID_ANCIANO)
      on delete restrict on update restrict;

