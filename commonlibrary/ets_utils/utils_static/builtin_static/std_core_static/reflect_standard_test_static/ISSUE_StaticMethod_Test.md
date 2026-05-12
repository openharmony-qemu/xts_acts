**Issues: 新需求 | Feature**

**标题**: 添加 reflect.StaticMethod 反射 API 静态方法完整测试用例

感谢提出新需求。

**新需求提供了什么功能？**

为 ArkTS-Sta reflect 模块的 StaticMethod 类提供完整的 15 个静态方法 API 测试用例，覆盖以下 API：

| API | 测试用例数 | 测试场景 |
|-----|:---:|------|
| `equals` | — | 比较两个 StaticMethod 对象是否指向同一方法 |
| `getName` | — | 获取静态方法名称 |
| `getOwner` | — | 获取声明该方法的类 |
| `getReturnType` | 19 | 基础类型/void/对象/数组/泛型/联合类型/Promise/null/undefined/this 返回类型 |
| `getParameterType` | — | 按索引获取指定参数类型 |
| `getParameterTypes` | — | 获取所有参数类型数组 |
| `getParametersNum` | — | 获取方法参数数量 |
| `invoke` | 35 | 无参/带参调用、参数匹配与不匹配异常、各类型返回值、TypeError/OutOfMemoryError/方法内异常处理、async 方法及 getter/setter 调用 |
| `isAsync` | 25 | async 方法返回 true、同步方法返回 false、不同访问级别和返回类型的 async 方法、async getter/setter、方法过滤 |
| `isGetter` | 24 | getter 方法返回 true、普通/setter 方法返回 false、不同访问级别和类型 getter、getter/setter 互斥及属性配对 |
| `isNative` | 20 | 用户定义方法均非 native、所有修饰符（async/getter/setter/不同访问级别）及类类型的兼容性判断 |
| `isPrivate` | 26 | private 方法返回 true、public/protected 返回 false、private async/final 组合、三访问级别排他性及方法过滤统计 |
| `isProtected` | 27 | protected 方法返回 true、public/private 返回 false、protected async/final 组合、继承关系、三访问级别互斥验证 |
| `isPublic` | 25 | public 方法返回 true、private/protected 返回 false、async/final public 方法、getter/setter 访问级别、排他性验证 |
| `isSetter` | 25 | setter 方法返回 true、普通/getter 方法返回 false、不同访问级别 setter、只写属性、getter/setter 互斥及属性类型一致性 |

**请描述下新需求的功能是什么，解决了什么问题**

该需求为 reflect.StaticMethod 类的所有 15 个公开 API 提供全面的自动化测试覆盖。测试覆盖了入参测试（参数个数/类型）、返回值测试（成功场景/特殊值/类型验证/边界值）、错误处理（TypeError/OutOfMemoryError/方法内异常）、注解组合（public/private/protected + async/final/@Deprecated）、异步方法场景（async static method/getter/setter）、兼容性测试（普通类/抽象类/final 类）、集合测试（批量调用/链式调用/方法过滤/属性配对）。解决 reflect.StaticMethod 反射 API 缺乏系统性测试验证的问题，确保反射静态方法相关功能在 API version 24 及后续版本中的正确性和稳定性。

**该需求带来的价值、应用场景**

- **质量保障**：通过覆盖正常路径、异常路径和边界条件的测试用例，确保 StaticMethod 反射 API 的正确性和鲁棒性
- **回归防护**：为后续版本迭代提供自动化回归测试，防止 API 变更引入缺陷
- **兼容性验证**：覆盖普通类/抽象类/final 类、不同访问级别、getter/setter、async 方法等场景，确保反射功能在各种类结构下正常工作
- **应用场景**：依赖反射机制的场景包括 ORM 框架、序列化/反序列化工具、依赖注入容器、动态代理、测试框架、脚手架代码生成等需要运行时获取静态方法元数据并调用的工具和框架
