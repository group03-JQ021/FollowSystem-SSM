prompt PL/SQL Developer import file
prompt Created on 2018��6��24�� by xizhan
set feedback off
set define off
prompt Creating ADMIN...
create table ADMIN
(
  adminid  NUMBER(7) not null,
  name     VARCHAR2(20) not null,
  password VARCHAR2(21) default '123456'
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN
  add primary key (ADMINID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CLASSDATE...
create table CLASSDATE
(
  classid   NUMBER(7) not null,
  classname VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column CLASSDATE.classid
  is '�༶id';
comment on column CLASSDATE.classname
  is '�༶����';
alter table CLASSDATE
  add constraint PK_CLASSID primary key (CLASSID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating COURSE...
create table COURSE
(
  courseid   NUMBER(7) not null,
  coursename VARCHAR2(10),
  coursetate VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column COURSE.courseid
  is '�γ�id';
comment on column COURSE.coursename
  is '�γ�����';
comment on column COURSE.coursetate
  is '�γ�״̬';
alter table COURSE
  add constraint PK_COURSEID primary key (COURSEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating DEPT...
create table DEPT
(
  deptid      NUMBER(7) not null,
  deptname    VARCHAR2(20),
  deptaddress VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column DEPT.deptid
  is '���ű��';
comment on column DEPT.deptname
  is '��������';
comment on column DEPT.deptaddress
  is '���ŵ�ַ';
alter table DEPT
  add constraint PK_DEPTID primary key (DEPTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EVALUATEDATE...
create table EVALUATEDATE
(
  dateid   NUMBER(7) not null,
  datename VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column EVALUATEDATE.dateid
  is '�ڵ�id';
comment on column EVALUATEDATE.datename
  is '�ڵ�����';
alter table EVALUATEDATE
  add constraint PK_DATEID primary key (DATEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating JOBEVALUATEOPTION...
create table JOBEVALUATEOPTION
(
  optionid    NUMBER(7) not null,
  optionname  VARCHAR2(20),
  optionstate VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column JOBEVALUATEOPTION.optionid
  is '����id';
comment on column JOBEVALUATEOPTION.optionname
  is '��������';
comment on column JOBEVALUATEOPTION.optionstate
  is '����״̬���Ƿ����ã�';
alter table JOBEVALUATEOPTION
  add constraint PK_OPTIONID primary key (OPTIONID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating STUDENT...
create table STUDENT
(
  stuid      NUMBER(7) not null,
  stuname    VARCHAR2(20),
  sex        VARCHAR2(2),
  nation     VARCHAR2(10),
  birthday   DATE,
  birthplace VARCHAR2(50),
  marry      VARCHAR2(2),
  telephone  VARCHAR2(12),
  idcard     VARCHAR2(18),
  university VARCHAR2(50),
  major      VARCHAR2(50),
  photo      VARCHAR2(200),
  note       VARCHAR2(200),
  state      VARCHAR2(20),
  classid    NUMBER(7),
  deptid     NUMBER(7)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column STUDENT.stuid
  is 'ѧ��id';
comment on column STUDENT.stuname
  is 'ѧ������';
comment on column STUDENT.sex
  is '�Ա�';
comment on column STUDENT.nation
  is '����';
comment on column STUDENT.birthday
  is '��������';
comment on column STUDENT.birthplace
  is '������';
comment on column STUDENT.marry
  is '���';
comment on column STUDENT.telephone
  is '�绰';
comment on column STUDENT.idcard
  is '���֤��';
comment on column STUDENT.university
  is '��ҵԺУ';
comment on column STUDENT.major
  is 'רҵ';
comment on column STUDENT.photo
  is '��Ƭ';
comment on column STUDENT.note
  is '��ע';
comment on column STUDENT.state
  is 'Ŀǰ״̬';
comment on column STUDENT.classid
  is '�༶';
comment on column STUDENT.deptid
  is '����';
alter table STUDENT
  add constraint PK_STUDENT primary key (STUID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STUDENT
  add constraint FK_CALSSID foreign key (CLASSID)
  references CLASSDATE (CLASSID);
alter table STUDENT
  add constraint FK_DAPTID foreign key (DEPTID)
  references DEPT (DEPTID);

prompt Creating JOBEVALUATION...
create table JOBEVALUATION
(
  dateid             NUMBER(7) not null,
  stuid              NUMBER(7) not null,
  optionid           NUMBER(7),
  evaluateperson     VARCHAR2(20),
  totalscore         NUMBER(4,2),
  jobevaluatecontent VARCHAR2(200),
  evaluatescore      NUMBER(4,2)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table JOBEVALUATION
  add constraint PK_JOBEVALUATION primary key (STUID, DATEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table JOBEVALUATION
  add constraint FK_DATEID foreign key (DATEID)
  references EVALUATEDATE (DATEID);
alter table JOBEVALUATION
  add constraint FK_OPTIONID foreign key (OPTIONID)
  references JOBEVALUATEOPTION (OPTIONID);
alter table JOBEVALUATION
  add constraint FK_STUIDEVA foreign key (STUID)
  references STUDENT (STUID);

prompt Creating MENU...
create table MENU
(
  menuid       NUMBER(7) not null,
  parentmenuid NUMBER(7),
  menuname     VARCHAR2(50),
  address      VARCHAR2(50),
  promptname   VARCHAR2(50),
  goal         VARCHAR2(50),
  image        VARCHAR2(200),
  imageshow    VARCHAR2(200),
  menushow     VARCHAR2(2),
  expressshun  VARCHAR2(50),
  deleteflag   VARCHAR2(2)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column MENU.menuid
  is '�˵�ID,����';
comment on column MENU.parentmenuid
  is '���˵�ID,���';
comment on column MENU.menuname
  is '�˵�����';
comment on column MENU.address
  is '�˵�·��';
alter table MENU
  add constraint PK_MENU primary key (MENUID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MENU
  add constraint FK_MENU foreign key (PARENTMENUID)
  references MENU (MENUID);

prompt Creating ROLE...
create table ROLE
(
  roleid       NUMBER(7) not null,
  rolename     VARCHAR2(20),
  roletype     VARCHAR2(7),
  note         VARCHAR2(200),
  flag         VARCHAR2(2),
  roleusertype VARCHAR2(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column ROLE.roleid
  is '��ɫid';
comment on column ROLE.rolename
  is '��ɫ����';
comment on column ROLE.roletype
  is '��ɫ����';
comment on column ROLE.note
  is '��ע';
comment on column ROLE.flag
  is '��ʶ';
comment on column ROLE.roleusertype
  is '�û���ɫ����';
alter table ROLE
  add constraint PK_ROLES primary key (ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROLEPOWER...
create table ROLEPOWER
(
  roleid NUMBER(7),
  menuid NUMBER(7)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column ROLEPOWER.roleid
  is '��ɫID,���';
comment on column ROLEPOWER.menuid
  is '�˵�ID,���';
alter table ROLEPOWER
  add constraint FK1_ROLEPOWER foreign key (ROLEID)
  references ROLE (ROLEID);
alter table ROLEPOWER
  add constraint FK2_ROLEPOWER foreign key (MENUID)
  references MENU (MENUID);

prompt Creating SCHOOLEVALUATION...
create table SCHOOLEVALUATION
(
  evaluateid      NUMBER(7) not null,
  stuid           NUMBER(7),
  evaluateperson  VARCHAR2(20),
  evaluatescore   NUMBER(4,2),
  evaluatecontent VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SCHOOLEVALUATION.evaluateid
  is '评价id';
comment on column SCHOOLEVALUATION.stuid
  is '学生id';
comment on column SCHOOLEVALUATION.evaluatescore
  is '评价成绩';
comment on column SCHOOLEVALUATION.evaluatecontent
  is '综合评语';
alter table SCHOOLEVALUATION
  add constraint PK_SCHOOLEVALUATION primary key (EVALUATEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCHOOLEVALUATION
  add constraint FK_STUDENTID foreign key (STUID)
  references STUDENT (STUID);

prompt Creating SCORE...
create table SCORE
(
  stuid    NUMBER(7) not null,
  courseid NUMBER(7) not null,
  score    NUMBER(7)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SCORE.stuid
  is '学生ID';
comment on column SCORE.courseid
  is '课程id';
comment on column SCORE.score
  is '成绩';
alter table SCORE
  add constraint PK_SCORE primary key (STUID, COURSEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCORE
  add constraint FK_COURSEID foreign key (COURSEID)
  references COURSE (COURSEID);
alter table SCORE
  add constraint FK_STUID foreign key (STUID)
  references STUDENT (STUID);

prompt Creating USERS...
create table USERS
(
  userid    NUMBER(7) not null,
  username  VARCHAR2(20),
  pwd       VARCHAR2(20),
  telephone NUMBER(11),
  phone     VARCHAR2(20),
  email     VARCHAR2(20),
  note      VARCHAR2(200),
  flag      VARCHAR2(2),
  logintime VARCHAR2(50),
  deptno    NUMBER(7)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column USERS.userid
  is '�û�Id,����';
comment on column USERS.username
  is '�û�����';
comment on column USERS.pwd
  is '����';
comment on column USERS.telephone
  is '�̶��绰';
comment on column USERS.phone
  is '�ֻ�';
comment on column USERS.email
  is '����';
comment on column USERS.note
  is '��ע';
comment on column USERS.flag
  is '��ʶ';
comment on column USERS.logintime
  is '��¼ʱ��';
comment on column USERS.deptno
  is '���ű��';
alter table USERS
  add constraint PK_USERS primary key (USERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add constraint FK_DEPTNO foreign key (DEPTNO)
  references DEPT (DEPTID);

prompt Creating USERROLERELATIONSHIP...
create table USERROLERELATIONSHIP
(
  userid NUMBER(7),
  roleid NUMBER(7)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column USERROLERELATIONSHIP.userid
  is '�û�ID';
comment on column USERROLERELATIONSHIP.roleid
  is '��ɫID';
alter table USERROLERELATIONSHIP
  add constraint FK1_USERROLERELATIONSHIP foreign key (USERID)
  references USERS (USERID);
alter table USERROLERELATIONSHIP
  add constraint FK2_USERROLERELATIONSHIP foreign key (ROLEID)
  references ROLE (ROLEID);

prompt Disabling triggers for ADMIN...
alter table ADMIN disable all triggers;
prompt Disabling triggers for CLASSDATE...
alter table CLASSDATE disable all triggers;
prompt Disabling triggers for COURSE...
alter table COURSE disable all triggers;
prompt Disabling triggers for DEPT...
alter table DEPT disable all triggers;
prompt Disabling triggers for EVALUATEDATE...
alter table EVALUATEDATE disable all triggers;
prompt Disabling triggers for JOBEVALUATEOPTION...
alter table JOBEVALUATEOPTION disable all triggers;
prompt Disabling triggers for STUDENT...
alter table STUDENT disable all triggers;
prompt Disabling triggers for JOBEVALUATION...
alter table JOBEVALUATION disable all triggers;
prompt Disabling triggers for MENU...
alter table MENU disable all triggers;
prompt Disabling triggers for ROLE...
alter table ROLE disable all triggers;
prompt Disabling triggers for ROLEPOWER...
alter table ROLEPOWER disable all triggers;
prompt Disabling triggers for SCHOOLEVALUATION...
alter table SCHOOLEVALUATION disable all triggers;
prompt Disabling triggers for SCORE...
alter table SCORE disable all triggers;
prompt Disabling triggers for USERS...
alter table USERS disable all triggers;
prompt Disabling triggers for USERROLERELATIONSHIP...
alter table USERROLERELATIONSHIP disable all triggers;
prompt Disabling foreign key constraints for STUDENT...
alter table STUDENT disable constraint FK_CALSSID;
alter table STUDENT disable constraint FK_DAPTID;
prompt Disabling foreign key constraints for JOBEVALUATION...
alter table JOBEVALUATION disable constraint FK_DATEID;
alter table JOBEVALUATION disable constraint FK_OPTIONID;
alter table JOBEVALUATION disable constraint FK_STUIDEVA;
prompt Disabling foreign key constraints for MENU...
alter table MENU disable constraint FK_MENU;
prompt Disabling foreign key constraints for ROLEPOWER...
alter table ROLEPOWER disable constraint FK1_ROLEPOWER;
alter table ROLEPOWER disable constraint FK2_ROLEPOWER;
prompt Disabling foreign key constraints for SCHOOLEVALUATION...
alter table SCHOOLEVALUATION disable constraint FK_STUDENTID;
prompt Disabling foreign key constraints for SCORE...
alter table SCORE disable constraint FK_COURSEID;
alter table SCORE disable constraint FK_STUID;
prompt Disabling foreign key constraints for USERS...
alter table USERS disable constraint FK_DEPTNO;
prompt Disabling foreign key constraints for USERROLERELATIONSHIP...
alter table USERROLERELATIONSHIP disable constraint FK1_USERROLERELATIONSHIP;
alter table USERROLERELATIONSHIP disable constraint FK2_USERROLERELATIONSHIP;
prompt Loading ADMIN...
insert into ADMIN (adminid, name, password)
values (1, 'abc', '123456');
commit;
prompt 1 records loaded
prompt Loading CLASSDATE...
insert into CLASSDATE (classid, classname)
values (1, '����001��');
insert into CLASSDATE (classid, classname)
values (2, '����002��');
insert into CLASSDATE (classid, classname)
values (3, '����003��');
commit;
prompt 3 records loaded
prompt Loading COURSE...
insert into COURSE (courseid, coursename, coursetate)
values (1, 'HTML', '��ͣ��');
insert into COURSE (courseid, coursename, coursetate)
values (2, 'Oracle', '��ͣ��');
insert into COURSE (courseid, coursename, coursetate)
values (3, 'JavaScript', '��ͣ��');
insert into COURSE (courseid, coursename, coursetate)
values (4, 'Java����', '��ͣ��');
insert into COURSE (courseid, coursename, coursetate)
values (5, 'Java�߼�', '��ѵ��');
commit;
prompt 5 records loaded
prompt Loading DEPT...
insert into DEPT (deptid, deptname, deptaddress)
values (1, '�����ܲ�', '���ϸ�����');
insert into DEPT (deptid, deptname, deptaddress)
values (2, '�Ͼ��ֹ�˾', '�Ͼ�');
insert into DEPT (deptid, deptname, deptaddress)
values (3, '�����ֹ�˾', '����');
commit;
prompt 3 records loaded
prompt Loading EVALUATEDATE...
insert into EVALUATEDATE (dateid, datename)
values (1, 'ת��');
insert into EVALUATEDATE (dateid, datename)
values (2, '����1��');
insert into EVALUATEDATE (dateid, datename)
values (3, '����2��');
commit;
prompt 3 records loaded
prompt Loading JOBEVALUATEOPTION...
insert into JOBEVALUATEOPTION (optionid, optionname, optionstate)
values (1, '�Ը�', 'ʹ����');
insert into JOBEVALUATEOPTION (optionid, optionname, optionstate)
values (2, '�˼ʹ�ϵ', 'ʹ����');
insert into JOBEVALUATEOPTION (optionid, optionname, optionstate)
values (3, '������', 'ʹ����');
insert into JOBEVALUATEOPTION (optionid, optionname, optionstate)
values (4, '��Ʒ', 'ʹ����');
insert into JOBEVALUATEOPTION (optionid, optionname, optionstate)
values (5, '������ͨ', 'ʹ����');
commit;
prompt 5 records loaded
prompt Loading STUDENT...
insert into STUDENT (stuid, stuname, sex, nation, birthday, birthplace, marry, telephone, idcard, university, major, photo, note, state, classid, deptid)
values (1, '������', '��', '��', to_date('14-06-1995', 'dd-mm-yyyy'), 'ɽ������', '��', '17865188886', '372923199506143515', '�й�ʯ�ʹ�ѧ', '����רҵ', null, null, '��ת��', 1, 1);
insert into STUDENT (stuid, stuname, sex, nation, birthday, birthplace, marry, telephone, idcard, university, major, photo, note, state, classid, deptid)
values (2, '����', '��', '��', to_date('14-05-1995', 'dd-mm-yyyy'), 'ɽ������', '��', '17865188896', '372923199505143515', '�й�ʯ�ʹ�ѧ', '����רҵ', null, null, '��ת��', 2, 1);
insert into STUDENT (stuid, stuname, sex, nation, birthday, birthplace, marry, telephone, idcard, university, major, photo, note, state, classid, deptid)
values (3, '����', '��', '��', to_date('14-06-1996', 'dd-mm-yyyy'), 'ɽ����Ұ', '��', '17865188906', '372923199606143515', '�й�ʯ�ʹ�ѧ', '����רҵ', null, null, '��ת��', 3, 1);
commit;
prompt 3 records loaded
prompt Loading JOBEVALUATION...
insert into JOBEVALUATION (dateid, stuid, optionid, evaluateperson, totalscore, jobevaluatecontent, evaluatescore)
values (1, 1, 1, '��', 95, '������Ŭ��.', 95);
insert into JOBEVALUATION (dateid, stuid, optionid, evaluateperson, totalscore, jobevaluatecontent, evaluatescore)
values (1, 2, 1, '��', 95, '������Ŭ��.', 95);
commit;
prompt 2 records loaded
prompt Loading MENU...
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (1, 0, '������Ϣά��', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (11, 1, '�û���Ϣ', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (12, 1, 'Ȩ�޹���', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (111, 11, '�û���Ϣ�嵥', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (112, 11, '�û���Ϣģ����ѯ', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (113, 11, '����û���Ϣ', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (114, 11, '�޸��û���Ϣ', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (115, 11, 'ɾ��/����ɾ���û���Ϣ', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (0, null, '���˵�,����ʾ', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (13, 1, '��ɫ����', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (121, 12, '�û���ɫ�嵥', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (122, 12, '�û���ɫ��ɾ', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (131, 13, '��ɫ�嵥', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (132, 13, '��ɫ����', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (133, 13, '��ɫ��ɾ', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (134, 13, '��ɫȨ������/����', null, null, null, null, null, null, null, null);
commit;
prompt 16 records loaded
prompt Loading ROLE...
insert into ROLE (roleid, rolename, roletype, note, flag, roleusertype)
values (1, 'ϵͳ����Ա', null, '�û���Ϣά���Լ��û�Ȩ��ά��', null, null);
insert into ROLE (roleid, rolename, roletype, note, flag, roleusertype)
values (2, '��Ϣά����Ա', null, '����ѧԱ���γ̼����ۼƻ��Ȼ�����Ϣά����', null, null);
insert into ROLE (roleid, rolename, roletype, note, flag, roleusertype)
values (3, '��ѵѧУ��ʦ', null, '����ѧԱ��ѵ�ڼ�����������ۡ�', null, null);
insert into ROLE (roleid, rolename, roletype, note, flag, roleusertype)
values (4, '��Ŀ����', null, 'ѧԱ�����ڼ������', null, null);
insert into ROLE (roleid, rolename, roletype, note, flag, roleusertype)
values (5, '�߹�', null, '�߹ܿ��Բ鿴ѧԱ��������', null, null);
commit;
prompt 5 records loaded
prompt Loading ROLEPOWER...
insert into ROLEPOWER (roleid, menuid)
values (1, null);
commit;
prompt 1 records loaded
prompt Loading SCHOOLEVALUATION...
insert into SCHOOLEVALUATION (evaluateid, stuid, evaluateperson, evaluatescore, evaluatecontent)
values (1, 1, '��', 96, '��ѧԱϰ�̿�,�����ι�,ѧ������, ����Ϊ��');
insert into SCHOOLEVALUATION (evaluateid, stuid, evaluateperson, evaluatescore, evaluatecontent)
values (103, 1, 'л', 95, '��ѧԱѧϰ�̿�');
commit;
prompt 2 records loaded
prompt Loading SCORE...
insert into SCORE (stuid, courseid, score)
values (1, 1, 85);
insert into SCORE (stuid, courseid, score)
values (1, 3, 94);
insert into SCORE (stuid, courseid, score)
values (1, 4, 89);
insert into SCORE (stuid, courseid, score)
values (1, 5, 96);
insert into SCORE (stuid, courseid, score)
values (1, 2, 80);
commit;
prompt 5 records loaded
prompt Loading USERS...
insert into USERS (userid, username, pwd, telephone, phone, email, note, flag, logintime, deptno)
values (1, '��', '123', 53188391, '15868998810', null, null, null, null, 1);
insert into USERS (userid, username, pwd, telephone, phone, email, note, flag, logintime, deptno)
values (2, 'Ǯ', '123', 53188392, '15868998811', null, null, null, null, 1);
insert into USERS (userid, username, pwd, telephone, phone, email, note, flag, logintime, deptno)
values (3, '��', '123', 53188339, '15868998812', null, null, null, null, 1);
insert into USERS (userid, username, pwd, telephone, phone, email, note, flag, logintime, deptno)
values (4, '��', '123', null, null, null, null, null, null, null);
insert into USERS (userid, username, pwd, telephone, phone, email, note, flag, logintime, deptno)
values (5, '��', '123', null, null, null, null, null, null, null);
insert into USERS (userid, username, pwd, telephone, phone, email, note, flag, logintime, deptno)
values (6, 'boss', 'boss', null, null, null, null, null, null, null);
commit;
prompt 6 records loaded
prompt Loading USERROLERELATIONSHIP...
insert into USERROLERELATIONSHIP (userid, roleid)
values (1, 1);
insert into USERROLERELATIONSHIP (userid, roleid)
values (2, 2);
insert into USERROLERELATIONSHIP (userid, roleid)
values (3, 3);
insert into USERROLERELATIONSHIP (userid, roleid)
values (4, 4);
insert into USERROLERELATIONSHIP (userid, roleid)
values (5, 5);
commit;
prompt 5 records loaded
prompt Enabling foreign key constraints for STUDENT...
alter table STUDENT enable constraint FK_CALSSID;
alter table STUDENT enable constraint FK_DAPTID;
prompt Enabling foreign key constraints for JOBEVALUATION...
alter table JOBEVALUATION enable constraint FK_DATEID;
alter table JOBEVALUATION enable constraint FK_OPTIONID;
alter table JOBEVALUATION enable constraint FK_STUIDEVA;
prompt Enabling foreign key constraints for MENU...
alter table MENU enable constraint FK_MENU;
prompt Enabling foreign key constraints for ROLEPOWER...
alter table ROLEPOWER enable constraint FK1_ROLEPOWER;
alter table ROLEPOWER enable constraint FK2_ROLEPOWER;
prompt Enabling foreign key constraints for SCHOOLEVALUATION...
alter table SCHOOLEVALUATION enable constraint FK_STUDENTID;
prompt Enabling foreign key constraints for SCORE...
alter table SCORE enable constraint FK_COURSEID;
alter table SCORE enable constraint FK_STUID;
prompt Enabling foreign key constraints for USERS...
alter table USERS enable constraint FK_DEPTNO;
prompt Enabling foreign key constraints for USERROLERELATIONSHIP...
alter table USERROLERELATIONSHIP enable constraint FK1_USERROLERELATIONSHIP;
alter table USERROLERELATIONSHIP enable constraint FK2_USERROLERELATIONSHIP;
prompt Enabling triggers for ADMIN...
alter table ADMIN enable all triggers;
prompt Enabling triggers for CLASSDATE...
alter table CLASSDATE enable all triggers;
prompt Enabling triggers for COURSE...
alter table COURSE enable all triggers;
prompt Enabling triggers for DEPT...
alter table DEPT enable all triggers;
prompt Enabling triggers for EVALUATEDATE...
alter table EVALUATEDATE enable all triggers;
prompt Enabling triggers for JOBEVALUATEOPTION...
alter table JOBEVALUATEOPTION enable all triggers;
prompt Enabling triggers for STUDENT...
alter table STUDENT enable all triggers;
prompt Enabling triggers for JOBEVALUATION...
alter table JOBEVALUATION enable all triggers;
prompt Enabling triggers for MENU...
alter table MENU enable all triggers;
prompt Enabling triggers for ROLE...
alter table ROLE enable all triggers;
prompt Enabling triggers for ROLEPOWER...
alter table ROLEPOWER enable all triggers;
prompt Enabling triggers for SCHOOLEVALUATION...
alter table SCHOOLEVALUATION enable all triggers;
prompt Enabling triggers for SCORE...
alter table SCORE enable all triggers;
prompt Enabling triggers for USERS...
alter table USERS enable all triggers;
prompt Enabling triggers for USERROLERELATIONSHIP...
alter table USERROLERELATIONSHIP enable all triggers;
set feedback on
set define on
prompt Done.
