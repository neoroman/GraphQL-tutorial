const models = require('../models');

const AdminDepartment = models.adminDepartment;
const AdminUser = models.adminUser;
const ProjectUserMap = models.projectUserMap;
const Project = models.project;
const Tasks = models.tasks;
const TaskMap = models.taskMap;
const Timetable = models.timetable;
const UserDept = models.userDept;

const resolvers = {
    Query: {
        getUserInfo: async (parent, args, context, info) => {
            try { 
                // 1

                
            } 
            catch(err) {console.log(err);} 
        }
    },
    Mutation: {
        putUserInfo: async (parent, args, context, info) => {
            try {
                // 2

                
            }
            catch(err) {
                console.log(err)
                return new Error("putUserInfo", err);
            };
        }
    }
}


export default resolvers;
