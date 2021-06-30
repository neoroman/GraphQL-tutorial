// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetUserInfoQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getUserInfo {
      getUserInfo(id: "neoroman") {
        __typename
        id
        groupId
        name
        email
        timeFlowClass
        standardWorkHours
        fcmToken
        department {
          __typename
          name
          deptCode
          parentDepartment {
            __typename
            name
            deptCode
            description
            parentDepartment {
              __typename
              name
              deptCode
              description
            }
          }
          description
          type
          status
        }
        rank
        position
        sex
        projectList {
          __typename
          name
          projectId
          projectCode
          taskList {
            __typename
            name
            taskId
            status
          }
          status
        }
        createTime
        updateTime
      }
    }
    """

  public let operationName: String = "getUserInfo"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getUserInfo", arguments: ["id": "neoroman"], type: .list(.object(GetUserInfo.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getUserInfo: [GetUserInfo?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "getUserInfo": getUserInfo.flatMap { (value: [GetUserInfo?]) -> [ResultMap?] in value.map { (value: GetUserInfo?) -> ResultMap? in value.flatMap { (value: GetUserInfo) -> ResultMap in value.resultMap } } }])
    }

    /// ########################################################################
    /// 사용자 정보 조회, 가입한 Project, Task, Department 등을 한번에 획득 가능함
    public var getUserInfo: [GetUserInfo?]? {
      get {
        return (resultMap["getUserInfo"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [GetUserInfo?] in value.map { (value: ResultMap?) -> GetUserInfo? in value.flatMap { (value: ResultMap) -> GetUserInfo in GetUserInfo(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GetUserInfo?]) -> [ResultMap?] in value.map { (value: GetUserInfo?) -> ResultMap? in value.flatMap { (value: GetUserInfo) -> ResultMap in value.resultMap } } }, forKey: "getUserInfo")
      }
    }

    public struct GetUserInfo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AdminUser"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("groupId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("timeFlowClass", type: .scalar(String.self)),
          GraphQLField("standardWorkHours", type: .scalar(Int.self)),
          GraphQLField("fcmToken", type: .scalar(String.self)),
          GraphQLField("department", type: .object(Department.selections)),
          GraphQLField("rank", type: .scalar(String.self)),
          GraphQLField("position", type: .scalar(String.self)),
          GraphQLField("sex", type: .scalar(String.self)),
          GraphQLField("projectList", type: .list(.object(ProjectList.selections))),
          GraphQLField("createTime", type: .nonNull(.scalar(String.self))),
          GraphQLField("updateTime", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, groupId: Int, name: String, email: String? = nil, timeFlowClass: String? = nil, standardWorkHours: Int? = nil, fcmToken: String? = nil, department: Department? = nil, rank: String? = nil, position: String? = nil, sex: String? = nil, projectList: [ProjectList?]? = nil, createTime: String, updateTime: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "AdminUser", "id": id, "groupId": groupId, "name": name, "email": email, "timeFlowClass": timeFlowClass, "standardWorkHours": standardWorkHours, "fcmToken": fcmToken, "department": department.flatMap { (value: Department) -> ResultMap in value.resultMap }, "rank": rank, "position": position, "sex": sex, "projectList": projectList.flatMap { (value: [ProjectList?]) -> [ResultMap?] in value.map { (value: ProjectList?) -> ResultMap? in value.flatMap { (value: ProjectList) -> ResultMap in value.resultMap } } }, "createTime": createTime, "updateTime": updateTime])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var groupId: Int {
        get {
          return resultMap["groupId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "groupId")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      /// 작업 시간 자동 입력 구분: AUTO000(수동입력), AUTO001(일별 자동 입력), AUTO002(주별 자동 입력), AUTO003(월별 자동 입력)
      /// getCodeGroup(id: "AUTO") 로 획득가능
      public var timeFlowClass: String? {
        get {
          return resultMap["timeFlowClass"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "timeFlowClass")
        }
      }

      /// 작업 시간 기준: 8 시간 (default)
      public var standardWorkHours: Int? {
        get {
          return resultMap["standardWorkHours"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "standardWorkHours")
        }
      }

      /// FCM 토큰 정보
      public var fcmToken: String? {
        get {
          return resultMap["fcmToken"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "fcmToken")
        }
      }

      public var department: Department? {
        get {
          return (resultMap["department"] as? ResultMap).flatMap { Department(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "department")
        }
      }

      public var rank: String? {
        get {
          return resultMap["rank"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "rank")
        }
      }

      public var position: String? {
        get {
          return resultMap["position"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "position")
        }
      }

      public var sex: String? {
        get {
          return resultMap["sex"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "sex")
        }
      }

      public var projectList: [ProjectList?]? {
        get {
          return (resultMap["projectList"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ProjectList?] in value.map { (value: ResultMap?) -> ProjectList? in value.flatMap { (value: ResultMap) -> ProjectList in ProjectList(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ProjectList?]) -> [ResultMap?] in value.map { (value: ProjectList?) -> ResultMap? in value.flatMap { (value: ProjectList) -> ResultMap in value.resultMap } } }, forKey: "projectList")
        }
      }

      /// createTime: unix timestamp 13자리(milli-second 포함)
      public var createTime: String {
        get {
          return resultMap["createTime"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createTime")
        }
      }

      /// updateTime: unix timestamp 13자리(milli-second 포함)
      public var updateTime: String? {
        get {
          return resultMap["updateTime"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updateTime")
        }
      }

      public struct Department: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AdminDepartment"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("deptCode", type: .nonNull(.scalar(String.self))),
            GraphQLField("parentDepartment", type: .object(ParentDepartment.selections)),
            GraphQLField("description", type: .scalar(String.self)),
            GraphQLField("type", type: .nonNull(.scalar(String.self))),
            GraphQLField("status", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, deptCode: String, parentDepartment: ParentDepartment? = nil, description: String? = nil, type: String, status: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "AdminDepartment", "name": name, "deptCode": deptCode, "parentDepartment": parentDepartment.flatMap { (value: ParentDepartment) -> ResultMap in value.resultMap }, "description": description, "type": type, "status": status])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var deptCode: String {
          get {
            return resultMap["deptCode"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "deptCode")
          }
        }

        public var parentDepartment: ParentDepartment? {
          get {
            return (resultMap["parentDepartment"] as? ResultMap).flatMap { ParentDepartment(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "parentDepartment")
          }
        }

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var type: String {
          get {
            return resultMap["type"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public var status: String? {
          get {
            return resultMap["status"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        public struct ParentDepartment: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["AdminDepartment"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("deptCode", type: .nonNull(.scalar(String.self))),
              GraphQLField("description", type: .scalar(String.self)),
              GraphQLField("parentDepartment", type: .object(ParentDepartment.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, deptCode: String, description: String? = nil, parentDepartment: ParentDepartment? = nil) {
            self.init(unsafeResultMap: ["__typename": "AdminDepartment", "name": name, "deptCode": deptCode, "description": description, "parentDepartment": parentDepartment.flatMap { (value: ParentDepartment) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var deptCode: String {
            get {
              return resultMap["deptCode"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "deptCode")
            }
          }

          public var description: String? {
            get {
              return resultMap["description"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          public var parentDepartment: ParentDepartment? {
            get {
              return (resultMap["parentDepartment"] as? ResultMap).flatMap { ParentDepartment(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "parentDepartment")
            }
          }

          public struct ParentDepartment: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["AdminDepartment"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("deptCode", type: .nonNull(.scalar(String.self))),
                GraphQLField("description", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, deptCode: String, description: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "AdminDepartment", "name": name, "deptCode": deptCode, "description": description])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var deptCode: String {
              get {
                return resultMap["deptCode"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "deptCode")
              }
            }

            public var description: String? {
              get {
                return resultMap["description"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "description")
              }
            }
          }
        }
      }

      public struct ProjectList: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Project"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("projectId", type: .nonNull(.scalar(Int.self))),
            GraphQLField("projectCode", type: .scalar(String.self)),
            GraphQLField("taskList", type: .list(.object(TaskList.selections))),
            GraphQLField("status", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, projectId: Int, projectCode: String? = nil, taskList: [TaskList?]? = nil, status: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Project", "name": name, "projectId": projectId, "projectCode": projectCode, "taskList": taskList.flatMap { (value: [TaskList?]) -> [ResultMap?] in value.map { (value: TaskList?) -> ResultMap? in value.flatMap { (value: TaskList) -> ResultMap in value.resultMap } } }, "status": status])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var projectId: Int {
          get {
            return resultMap["projectId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "projectId")
          }
        }

        public var projectCode: String? {
          get {
            return resultMap["projectCode"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "projectCode")
          }
        }

        public var taskList: [TaskList?]? {
          get {
            return (resultMap["taskList"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [TaskList?] in value.map { (value: ResultMap?) -> TaskList? in value.flatMap { (value: ResultMap) -> TaskList in TaskList(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [TaskList?]) -> [ResultMap?] in value.map { (value: TaskList?) -> ResultMap? in value.flatMap { (value: TaskList) -> ResultMap in value.resultMap } } }, forKey: "taskList")
          }
        }

        public var status: String? {
          get {
            return resultMap["status"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        public struct TaskList: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Tasks"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("taskId", type: .nonNull(.scalar(Int.self))),
              GraphQLField("status", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, taskId: Int, status: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Tasks", "name": name, "taskId": taskId, "status": status])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var taskId: Int {
            get {
              return resultMap["taskId"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "taskId")
            }
          }

          public var status: String? {
            get {
              return resultMap["status"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }
        }
      }
    }
  }
}
