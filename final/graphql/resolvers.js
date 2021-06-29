import { sequelize } from "../models";

const utils = require("../utils");
const models = require('../models');

const AdminDepartment = models.adminDepartment
const AdminUser = models.adminUser
const Project = models.project
const ProjectUserMap = models.projectUserMap
const Tasks = models.tasks
const TaskMap = models.taskMap
const Timetable = models.timetable
const UserDept = models.userDept

var localUserId = null;
const db = models.sequelize;
const Op = require("sequelize").Op;

const resolvers = {
    Query: {
        isLogin: async (parent, args, context, info) => {
            try {
                // const deToken = await jwt.verify(context.token, SECRET);
                // console.log("Decoded Token => " + deToken);        

                return typeof context.user !== 'undefined';
            } catch(err) {
                return false;
            }
        },
        getAdminDepartment: async (parent, args, context, info) => {
            try {
                const items = await AdminDepartment.findAll({
                    limit: args.limit,
                    offset: args.offset
                });
                return items;
            }
            catch(err) {console.log(err);} 
        },
        getUserInfo: async (parent, args, context, info) => {
            try { 
                if (context.user) {
                    localUserId = context.user.id;
                }   
                let userId = { id: args.id }
                const items = await AdminUser.findAll({ where: userId });
                return items; 
            } 
            catch(err) {console.log(err);} 
        },
        getProject: async (parent, args, context, info) => { 
            try {
                const items = await Project.findAll({
                    where: { 
                        projectId: args.id
                    },
                    limit: args.limit,
                    offset: args.offset
                });
                return items;
            }
            catch(err) {console.log(err);} 
        },
        getTasks: async (parent, args, context, info) => {
            try {
                const items = await Tasks.findAll({ 
                    where: { 
                        taskId: args.id
                    },
                    limit: args.limit,
                    offset: args.offset
                });
                return items;
            }
            catch(err) {console.log(err);}
        },
        getUserTask: async (parent, args, context, info) => {
            try {
                const items = await TaskMap.findAll({ 
                    where: { 
                        userId: args.userId
                    },
                    limit: args.limit,
                    offset: args.offset
                });
                return items;
            }
            catch(err) {console.log(err);}
        },
        getTimetable: async (parent, args, context, info) => {
            try {
                const items = await Timetable.findAll({ 
                    where: { 
                        userId: args.userId, 
                        workDay: { [Op.startsWith]: args.date }
                    },
                    limit: args.limit,
                    offset: args.offset
                });
                return items; 
            }
            catch(err) {console.log(err);} 
        },
        getWorkTimeTotal: async (parent, args, context, info) => {
            try {
                var total = 0;
                var likeCondition = [];
                var lastDay = utils.to_date(args.date);

                if (args.date.length == 8 && args.durationDay > 0) {
                    var aDate = utils.to_date(args.date);
                    lastDay.setDate(aDate.getDate() + args.durationDay - 1);

                    var i;
                    for (i = 0; i < args.durationDay; i ++) {
                        var temp = aDate;
                        likeCondition.push({ workDay: { [Op.like]: utils.get_date_str(temp) + "%" } });
                        temp.setDate(aDate.getDate() + 1)
                    }
                }
                if (likeCondition.length > 0) {
                    total = await Timetable.sum('workHour', { where: { 
                        userId: args.userId,
                        [Op.or]: likeCondition
                    }});
                } else {
                    total = await Timetable.sum('workHour', { where: { 
                        userId: args.userId,
                        workDay: { [Op.startsWith]: args.date } 
                    }});
                }

                var desc = "Good";
                var yesOrNo = true;
                if (args.date.length <= 4) {
                    desc = "Cannot recommend work time in '" + args.date + "'";
                } else if (args.date.length <= 6) {
                    if (total > (52 * 4)) {
                        desc = "Warning: work time cannot over 52 hours per week in '" + args.date + "'";
                        yesOrNo = false;
                    }
                } else if (args.durationDay >= 5 || args.durationDay <= 7) {
                    if (total > 52) {
                        const endDay = utils.get_date_str(lastDay)
                        desc = "Warning: work time cannot over 52 hours per week in '" + args.date + "' ~ '" + endDay + "'";
                        yesOrNo = false;
                    }
                }

                return {
                    totalHour: total ? total : 0,
                    description: desc,
                    success: yesOrNo
                };
            }
            catch(err) {console.log(err);} 
        }
    },
    AdminDepartment: {
        parentDepartment: async (parent) => {
            return await AdminDepartment.findOne({ where: { deptCode: parent.parentDeptCode } })
        }
    },
    Project: {
        department: async (project) => {
            return await AdminDepartment.findOne({ where: { deptCode: project.deptCode } });
        },
        taskList: async (project) => {
            var tasks;
            if (localUserId) {
                tasks = await TaskMap.findAll({ 
                    where: { 
                        projectId: project.projectId,
                        userId: localUserId
                    },
                    attributes: ['taskId'],
                    raw: true
                });
            } else {
                tasks = await TaskMap.findAll({ 
                    where: { 
                        projectId: project.projectId
                    },
                    attributes: ['taskId'],
                    raw: true
                });
            }
            const taskIDs = tasks.map( tasks => tasks.taskId );
            return await Tasks.findAll({
                where: {
                    taskId: {
                        [Op.in]: taskIDs
                    }
                }
            });
        }
    },
    TaskMap: {
        project: async (map) => {
            return await Project.findOne({ where: { projectId: map.projectId }});
        },
        task: async (map) => {
            return await Tasks.findOne({ where: { taskId: map.taskId } });
        }
    },
    Timetable: {
        project: async (timetable) => {
            return await Project.findOne({ where: { projectId: timetable.projectId }});
        },
        task: async (timetable) => {
            return await Tasks.findOne({ where: { taskId: timetable.taskId } });
        }
    },
    AdminUser: {
        department: async (user) => {
            const userDept = await UserDept.findOne({ where: { userId: user.id } });
            return await AdminDepartment.findOne({ where: { deptCode: userDept.deptCode } });
        },
        projectList: async (user) => {
            const projectMap = await ProjectUserMap.findAll({ 
                where: { userId: user.id, status: 'C002001' },
                attributes: ['projectId'],
                raw: true
            });
            const projIDs = projectMap.map( projects => projects.projectId );
            const projects = await Project.findAll({
                where: {
                    projectId: {
                        [Op.in]: projIDs
                    }
                }
            });
            return projects;
        }
    },
    Mutation: {
        updateUserInfo: async (parent, args, context, info) => {
            try {
                const user = await AdminUser.findOne({ where: { id: args.id } });
                const info = args.userInfo;
                const enable = (user.groupId == 1 || user.groupId == 44 || user.groupId == 47)
                if (user) {
                    // GropuId == 4 means '임직원'
                    if (info.name && enable) {
                        user.set('name', info.name);
                    }
                    if (info.password) {
                        const passQuery = "SHA1('" + info.password + "')";
                        var sha1Pass = "";
                        await db.query(`SELECT ${passQuery};`)
                        .then(function(result){
                            sha1Pass = result[0][0][passQuery];
                        });
                        user.set('password', sha1Pass);
                        user.set('updateTime', new Date().toLocaleDateString());
                    }
                    if (info.email && enable) {
                        user.set('email', info.email);
                    }
                    if (info.groupId && enable) {
                        // TODO
                    }
                    if (info.department && enable) {
                        // TODO
                        //user.set('department', args.department);
                    }
                    if (info.rank && enable) {
                        user.set('rank', info.rank);
                    }
                    if (info.position && enable) {
                        user.set('position', info.position);
                    }
                    if (info.sex && enable) {
                        user.set('sex', info.sex);
                    }
                    if (info.address) {
                        user.set('address', info.address);
                    }
                    if (info.officePhone) {
                        user.set('officePhone', info.officePhone);
                    }
                    if (info.mobilePhone) {
                        user.set('mobilePhone', info.mobilePhone);
                    }
                    if (info.familyPhone) {
                        user.set('familyPhone', info.familyPhone);
                    }
                    if (info.executive && enable) {
                        user.set('executive', info.executive);
                    }
                    if (info.projectList) {
                        console.log("Update projects => " + JSON.stringify(info.projectList));
                    }
                    if (info.timeFlowClass) {
                        user.set('timeFlowClass', info.timeFlowClass);
                    }
                    if (info.standardWorkHours) {
                        user.set('standardWorkHours', info.standardWorkHours);
                    }
                    if (info.fcmToken) {
                        user.set('fcmToken', info.fcmToken);
                    }
                    return await user.save();
                }
                return new Error("No user(id = "+ args.id +") registered!");
            }
            catch(err) {console.log(err);} 
        },
        putWorkTime: async (parent, args, context, info) => {
            try {
                const projectTask = await TaskMap.findOne({ 
                    where: { 
                        userId: args.userId, 
                        projectId: args.projectId,
                        taskId: args.taskId
                    },
                    attributes: ['projectId', 'taskId'],
                    raw: true
                });
                if (!projectTask) {
                    return new Error("TimeTable Error: No task (id=" + args.taskId + "), you should sign-in task of project(" + args.projectId + ") first.");
                }

                if (args.workHour > 0) {
                    var time = await Timetable.findOne(
                        { where: 
                            { 
                                userId: args.userId, 
                                workDay: args.workDay,
                                projectId: args.projectId,
                                taskId: args.taskId 
                            }
                        }
                    );
                    if (time) {
                        time.set('workHour', Math.round(args.workHour));
                        return await time.save();
                    } else {
                        return await Timetable.create({
                            userId: args.userId,
                            workDay: args.workDay,
                            projectId: args.projectId,
                            taskId: args.taskId,
                            workHour: Math.round(args.workHour)
                        });
                    }
                } else {
                    return new Error("TimeTable Error: workHour == 0");
                }
            }
            catch(err) {console.log(err);} 
        },
        putMultipleWorkTime: async (parent, args, context, info) => {
            if (args.count != args.worktimes.length) { return new Error("Count mismatched") };

            var i = 0;
            var processCount = 0;
            var createArray = [];
            try {
                // Update
                for (i = 0; i < args.count; i++) {
                    var item = args.worktimes[i];
                    const projectTask = await TaskMap.findOne({ 
                        where: { 
                            userId: item.userId, 
                            projectId: item.projectId,
                            taskId: item.taskId
                        },
                        attributes: ['projectId', 'taskId'],
                        raw: true
                    });
                    if (!projectTask) {
                        return new Error("TimeTable Error: No task (id=" + item.taskId + "), you should sign-in task of project(" + item.projectId + ") first.");
                    }
    
                    if (item.workHour > 0) {
                        var time = await Timetable.findOne(
                            { where: { 
                                userId: item.userId, 
                                workDay: item.workDay,
                                projectId: item.projectId,
                                taskId: item.taskId }
                            }
                        );
                        if (time) {
                            await Timetable.update(
                                { workHour: Math.round(item.workHour) },
                                { where: { 
                                    userId: item.userId, 
                                    workDay: item.workDay,
                                    projectId: item.projectId,
                                    taskId: item.taskId }
                                }
                            );
                            processCount = processCount + 1;
                        } else {
                            createArray.push({
                                userId: item.userId,
                                workDay: item.workDay,
                                projectId: item.projectId,
                                taskId: item.taskId,
                                workHour: Math.round(item.workHour)
                            });
                        }
                    }                
                }
                // Create
                if (createArray.length > 0) {
                    console.log("Bulk => " + createArray);
                    await Timetable.bulkCreate(createArray);
                    processCount = processCount + createArray.length;
                }
            }
            catch(err) {console.log(err)};

            const month = args.worktimes[0].workDay.substring(0,6);
            try {
                const total = await Timetable.sum('workHour', { where: { workDay: { [Op.startsWith]: month } }});
                var desc = "Failed: bulk update / create timetable failed, count: " + processCount + ", totalHour is month(" + month + ") total.";
                var yesOrNo = false;
                if (processCount == args.worktimes.length) { 
                    desc = "Success: bulk update / create timetable succeeded, count: " + processCount + ", totalHour is month(" + month + ") total.";;
                    yesOrNo = true;
                }
                return {
                    totalHour: total,
                    description: desc,
                    success: yesOrNo
                };
            }
            catch(err) {console.log(err);}
        },
        putWorkTimeFlow: async (parent, args, context, info) => {
            if (args.count != args.flows.length) { return new Error("Count mismatched") };

            var i = 0;
            var percentSum = 0;
            try {
                // Update
                for (i = 0; i < args.count; i++) {
                    var item = args.flows[i];

                    if (item.percentage > 0) {
                        var map = await TaskMap.findOne(
                            { 
                                where: { 
                                    userId: item.userId, 
                                    projectId: item.projectId,
                                    taskId: item.taskId
                                }
                            }
                        );
                        if (map) {
                            await TaskMap.update(
                                { percentage: item.percentage },
                                { 
                                    where: { 
                                        userId: item.userId, 
                                        projectId: item.projectId,
                                        taskId: item.taskId
                                    }
                                }
                            );
                            percentSum = percentSum + item.percentage
                        } else {
                            return new Error("WorkTimeFlow Error: No task (id=" + item.taskId + "), you should sign-in task of project(" + item.projectId + ") first.");
                        }
                    } else {
                        return new Error("WorkTimeFlow Error: No percentage for task (id=" + item.taskId + "), project(" + item.projectId + ").");
                    }            
                }

                if  (percentSum !== 1.0) {
                    return new Error("WorkTimeFlow Error: percentage input(" + percentSum * 100 + "%) is not 100%");
                }
                const userTask = await TaskMap.findAll({ where: { userId: args.userId, percentage: { [Op.gt]: 0 } }});
                console.log("UserTask => " + JSON.stringify(userTask));
                return userTask;
            }
            catch(err) {console.log(err);} 
        },
        processAutoTimeFlow: async (parent, args, context, info) => {
            const projectTask = await TaskMap.findAll({ 
                where: { 
                    userId: args.userId, 
                    percentage: { [Op.gt]: 0 }
                },
                attributes: ['projectId', 'taskId', 'percentage'],
                raw: true
            });
            if (!projectTask) {
                return new Error("ProcessAutoTimeFlow Error: no workTimeFlow percentage set, use putWorkTimeFlow() first.");
            } else if (projectTask.map(x => x.percentage).reduce((a,b) => a + b) != 1) {
                return new Error("ProcessAutoTimeFlow Error: WorkTimeFlow percentage is not 100%, use putWorkTimeFlow() first.");
            }

            var weekdayList = [];
            const userInfo = await AdminUser.findOne({ where: { id: args.userId }, attributes: ['timeFlowClass', 'standardWorkHours'], raw: true });
            if (userInfo.timeFlowClass === 'AUTO000') {
                return new Error("ProcessAutoTimeFlow Error: user set manual workTimeFlow already, use putWorkTimeFlow().");
            } else if (userInfo.timeFlowClass === 'AUTO001') { // 일별 자동 입력
                if (args.workDay.length < 8) {
                    weekdayList.push(utils.get_date_str(new Date()));
                } else {
                    weekdayList.push(args.workDay);
                }
            } else if (userInfo.timeFlowClass === 'AUTO002') { // 주별 자동 입력
                var pDay = args.workDay;
                if (args.workDay.length < 8) {
                    pDay = utils.get_date_str(new Date());
                }
                weekdayList = utils.getWeekdaysInWeek(pDay);
            } else if (userInfo.timeFlowClass === 'AUTO003') { // 월별 자동 입력
                var pDay = args.workDay;
                if (args.workDay.length < 4) {
                    pDay = utils.get_date_str(new Date());
                }
                weekdayList = utils.getWeekdaysInMonth(pDay);
            }
            console.log("AutoFlow weekdayList =>", weekdayList);

            var createArray = [];
            try {
                var i = 0;
                // create rows
                for (i = 0; i < weekdayList.length; i++) {
                    var j = 0;
                    for (j = 0; j < projectTask.length; j++) {
                        createArray.push({
                            userId: args.userId,
                            workDay: weekdayList[i],
                            projectId: projectTask[j].projectId,
                            taskId: projectTask[j].taskId,
                            workHour: Math.round(projectTask[j].percentage * userInfo.standardWorkHours)
                        });
                    }
                }
                for (i = 0; i < createArray.length; i++) {
                    var item = createArray[i];
                    if (item) {
                        var time = await Timetable.findOne({ 
                            where: { 
                                userId: item.userId, 
                                workDay: item.workDay,
                                projectId: item.projectId,
                                taskId: item.taskId 
                            }
                        });
                        if (time) {
                            // Update
                            await Timetable.update(
                                { workHour: Math.round(item.workHour) },
                                { where: { 
                                    userId: item.userId, 
                                    workDay: item.workDay,
                                    projectId: item.projectId,
                                    taskId: item.taskId }
                                }
                            );
                        } else {
                            // Insert
                            await Timetable.create({ 
                                userId: item.userId, 
                                workDay: item.workDay,
                                projectId: item.projectId,
                                taskId: item.taskId,
                                workHour: Math.round(item.workHour)
                            });
                        }
                    }
                }
            }
            catch(err) {console.log(err)};

            return createArray;
        }
    }
 }

export default resolvers;
