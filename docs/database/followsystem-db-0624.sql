prompt PL/SQL Developer import file
prompt Created on 2018年6月24日 by xizhan
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
  is '班级id';
comment on column CLASSDATE.classname
  is '班级名称';
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
  is '课程id';
comment on column COURSE.coursename
  is '课程名称';
comment on column COURSE.coursetate
  is '课程状态';
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
  is '部门编号';
comment on column DEPT.deptname
  is '部门名称';
comment on column DEPT.deptaddress
  is '部门地址';
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
  is '节点id';
comment on column EVALUATEDATE.datename
  is '节点名称';
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
  is '分项id';
comment on column JOBEVALUATEOPTION.optionname
  is '分项名称';
comment on column JOBEVALUATEOPTION.optionstate
  is '分项状态（是否在用）';
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
  is '学生id';
comment on column STUDENT.stuname
  is '学生姓名';
comment on column STUDENT.sex
  is '性别';
comment on column STUDENT.nation
  is '民族';
comment on column STUDENT.birthday
  is '出生日期';
comment on column STUDENT.birthplace
  is '出生地';
comment on column STUDENT.marry
  is '婚否';
comment on column STUDENT.telephone
  is '电话';
comment on column STUDENT.idcard
  is '身份证号';
comment on column STUDENT.university
  is '毕业院校';
comment on column STUDENT.major
  is '专业';
comment on column STUDENT.photo
  is '照片';
comment on column STUDENT.note
  is '备注';
comment on column STUDENT.state
  is '目前状态';
comment on column STUDENT.classid
  is '班级';
comment on column STUDENT.deptid
  is '部门';
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
  is '菜单ID,主键';
comment on column MENU.parentmenuid
  is '父菜单ID,外键';
comment on column MENU.menuname
  is '菜单名称';
comment on column MENU.address
  is '菜单路径';
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
  is '角色id';
comment on column ROLE.rolename
  is '角色名称';
comment on column ROLE.roletype
  is '角色类型';
comment on column ROLE.note
  is '备注';
comment on column ROLE.flag
  is '标识';
comment on column ROLE.roleusertype
  is '用户角色类型';
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
  is '角色ID,外键';
comment on column ROLEPOWER.menuid
  is '菜单ID,外键';
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
  is '璇勪环id';
comment on column SCHOOLEVALUATION.stuid
  is '瀛︾敓id';
comment on column SCHOOLEVALUATION.evaluatescore
  is '璇勪环鎴愮哗';
comment on column SCHOOLEVALUATION.evaluatecontent
  is '缁煎悎璇勮';
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
  is '瀛︾敓ID';
comment on column SCORE.courseid
  is '璇剧▼id';
comment on column SCORE.score
  is '鎴愮哗';
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
  is '用户Id,主键';
comment on column USERS.username
  is '用户姓名';
comment on column USERS.pwd
  is '密码';
comment on column USERS.telephone
  is '固定电话';
comment on column USERS.phone
  is '手机';
comment on column USERS.email
  is '邮箱';
comment on column USERS.note
  is '备注';
comment on column USERS.flag
  is '标识';
comment on column USERS.logintime
  is '登录时间';
comment on column USERS.deptno
  is '部门编号';
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
  is '用户ID';
comment on column USERROLERELATIONSHIP.roleid
  is '角色ID';
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
values (1, '金桥001期');
insert into CLASSDATE (classid, classname)
values (2, '金桥002期');
insert into CLASSDATE (classid, classname)
values (3, '金桥003期');
commit;
prompt 3 records loaded
prompt Loading COURSE...
insert into COURSE (courseid, coursename, coursetate)
values (1, 'HTML', '已停课');
insert into COURSE (courseid, coursename, coursetate)
values (2, 'Oracle', '已停课');
insert into COURSE (courseid, coursename, coursetate)
values (3, 'JavaScript', '已停课');
insert into COURSE (courseid, coursename, coursetate)
values (4, 'Java基础', '已停课');
insert into COURSE (courseid, coursename, coursetate)
values (5, 'Java高级', '培训中');
commit;
prompt 5 records loaded
prompt Loading DEPT...
insert into DEPT (deptid, deptname, deptaddress)
values (1, '济南总部', '济南高新区');
insert into DEPT (deptid, deptname, deptaddress)
values (2, '南京分公司', '南京');
insert into DEPT (deptid, deptname, deptaddress)
values (3, '北京分公司', '北京');
commit;
prompt 3 records loaded
prompt Loading EVALUATEDATE...
insert into EVALUATEDATE (dateid, datename)
values (1, '转正');
insert into EVALUATEDATE (dateid, datename)
values (2, '工作1年');
insert into EVALUATEDATE (dateid, datename)
values (3, '工作2年');
commit;
prompt 3 records loaded
prompt Loading JOBEVALUATEOPTION...
insert into JOBEVALUATEOPTION (optionid, optionname, optionstate)
values (1, '性格', '使用中');
insert into JOBEVALUATEOPTION (optionid, optionname, optionstate)
values (2, '人际关系', '使用中');
insert into JOBEVALUATEOPTION (optionid, optionname, optionstate)
values (3, '积极性', '使用中');
insert into JOBEVALUATEOPTION (optionid, optionname, optionstate)
values (4, '人品', '使用中');
insert into JOBEVALUATEOPTION (optionid, optionname, optionstate)
values (5, '交流沟通', '使用中');
commit;
prompt 5 records loaded
prompt Loading STUDENT...
insert into STUDENT (stuid, stuname, sex, nation, birthday, birthplace, marry, telephone, idcard, university, major, photo, note, state, classid, deptid)
values (1, '王宇清', '男', '汉', to_date('14-06-1995', 'dd-mm-yyyy'), '山东济南', '否', '17865188886', '372923199506143515', '中国石油大学', '材料专业', null, null, '已转正', 1, 1);
insert into STUDENT (stuid, stuname, sex, nation, birthday, birthplace, marry, telephone, idcard, university, major, photo, note, state, classid, deptid)
values (2, '李明', '男', '汉', to_date('14-05-1995', 'dd-mm-yyyy'), '山东济南', '否', '17865188896', '372923199505143515', '中国石油大学', '材料专业', null, null, '已转正', 2, 1);
insert into STUDENT (stuid, stuname, sex, nation, birthday, birthplace, marry, telephone, idcard, university, major, photo, note, state, classid, deptid)
values (3, '刘恺', '男', '汉', to_date('14-06-1996', 'dd-mm-yyyy'), '山东巨野', '否', '17865188906', '372923199606143515', '中国石油大学', '材料专业', null, null, '已转正', 3, 1);
commit;
prompt 3 records loaded
prompt Loading JOBEVALUATION...
insert into JOBEVALUATION (dateid, stuid, optionid, evaluateperson, totalscore, jobevaluatecontent, evaluatescore)
values (1, 1, 1, '李', 95, '工作很努力.', 95);
insert into JOBEVALUATION (dateid, stuid, optionid, evaluateperson, totalscore, jobevaluatecontent, evaluatescore)
values (1, 2, 1, '张', 95, '工作很努力.', 95);
commit;
prompt 2 records loaded
prompt Loading MENU...
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (1, 0, '基本信息维护', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (11, 1, '用户信息', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (12, 1, '权限管理', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (111, 11, '用户信息清单', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (112, 11, '用户信息模糊查询', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (113, 11, '添加用户信息', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (114, 11, '修改用户信息', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (115, 11, '删除/批量删除用户信息', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (0, null, '根菜单,不显示', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (13, 1, '角色管理', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (121, 12, '用户角色清单', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (122, 12, '用户角色增删', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (131, 13, '角色清单', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (132, 13, '角色详情', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (133, 13, '角色增删', null, null, null, null, null, null, null, null);
insert into MENU (menuid, parentmenuid, menuname, address, promptname, goal, image, imageshow, menushow, expressshun, deleteflag)
values (134, 13, '角色权限授予/回收', null, null, null, null, null, null, null, null);
commit;
prompt 16 records loaded
prompt Loading ROLE...
insert into ROLE (roleid, rolename, roletype, note, flag, roleusertype)
values (1, '系统管理员', null, '用户信息维护以及用户权限维护', null, null);
insert into ROLE (roleid, rolename, roletype, note, flag, roleusertype)
values (2, '信息维护人员', null, '负责学员、课程及评价计划等基本信息维护。', null, null);
insert into ROLE (roleid, rolename, roletype, note, flag, roleusertype)
values (3, '培训学校讲师', null, '负责学员培训期间的评分与评价。', null, null);
insert into ROLE (roleid, rolename, roletype, note, flag, roleusertype)
values (4, '项目经理', null, '学员工作期间的评价', null, null);
insert into ROLE (roleid, rolename, roletype, note, flag, roleusertype)
values (5, '高管', null, '高管可以查看学员所有评价', null, null);
commit;
prompt 5 records loaded
prompt Loading ROLEPOWER...
insert into ROLEPOWER (roleid, menuid)
values (1, null);
commit;
prompt 1 records loaded
prompt Loading SCHOOLEVALUATION...
insert into SCHOOLEVALUATION (evaluateid, stuid, evaluateperson, evaluatescore, evaluatecontent)
values (1, 1, '李', 96, '该学员习刻苦,基础牢固,学以致用, 评级为优');
insert into SCHOOLEVALUATION (evaluateid, stuid, evaluateperson, evaluatescore, evaluatecontent)
values (103, 1, '谢', 95, '该学员学习刻苦');
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
values (1, '赵', '123', 53188391, '15868998810', null, null, null, null, 1);
insert into USERS (userid, username, pwd, telephone, phone, email, note, flag, logintime, deptno)
values (2, '钱', '123', 53188392, '15868998811', null, null, null, null, 1);
insert into USERS (userid, username, pwd, telephone, phone, email, note, flag, logintime, deptno)
values (3, '孙', '123', 53188339, '15868998812', null, null, null, null, 1);
insert into USERS (userid, username, pwd, telephone, phone, email, note, flag, logintime, deptno)
values (4, '李', '123', null, null, null, null, null, null, null);
insert into USERS (userid, username, pwd, telephone, phone, email, note, flag, logintime, deptno)
values (5, '周', '123', null, null, null, null, null, null, null);
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
