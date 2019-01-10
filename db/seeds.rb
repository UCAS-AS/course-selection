# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Department.create!(dno: 'math', name: '数学科学学院')
Department.create!(dno: 'physics', name: '物理科学学院')
Department.create!(dno: 'nuclear', name: '核科学与技术学院')
Department.create!(dno: 'astro', name: '天文与空间科学学院')
Department.create!(dno: 'eng', name: '工程科学学院')
Department.create!(dno: 'ai', name: '人工智能学院')
Department.create!(dno: 'chem', name: '化学科学学院')
Department.create!(dno: 'sce', name: '化学工程学院')
Department.create!(dno: 'cmo', name: '材料科学与光电技术学院')
Department.create!(dno: 'oe', name: '光电学院')
Department.create!(dno: 'nano', name: '纳米科学与技术学院')
Department.create!(dno: 'sft', name: '未来技术学院')
Department.create!(dno: 'earth', name: '地球与行星科学学院')
Department.create!(dno: 'cre', name: '资源与环境学院')
Department.create!(dno: 'bio', name: '生命科学学院')
Department.create!(dno: 'agri', name: '现代农业科学学院')
Department.create!(dno: 'med', name: '存济医学院')
Department.create!(dno: 'scce', name: '计算机与控制学院')
Department.create!(dno: 'scs', name: '网络空间安全学院')
Department.create!(dno: 'eece', name: '电子电气与通信工程学院')
Department.create!(dno: 'sme', name: '微电子学院')
Department.create!(dno: 'sem', name: '经济与管理学院')
Department.create!(dno: 'sppm', name: '公共政策与管理学院')
Department.create!(dno: 'ip', name: '知识产权学院')
Department.create!(dno: 'renwen', name: '人文学院')
Department.create!(dno: 'marxism', name: '马克思主义学院')
Department.create!(dno: 'sie', name: '创新创业学院')
Department.create!(dno: 'artscenter', name: '艺术中心')
Department.create!(dno: 'foreign', name: '外语系')
Department.create!(dno: 'psych', name: '心理学系')
Department.create!(dno: 'sdc', name: '中丹学院')
Department.create!(dno: 'ic', name: '国际学院')

dept = Department.find_by(dno: 'scce')

dept.students.create!(sno: '2018E000000000',
                      name: '颜复海',
                      email: 'yan_fuhai@foxmail.com',
                      gender: '男',
                      enrolled_date: '2018-09-01',
                      birth_date: '1995-12-02',
                      degree: '硕士',
                      phone: '18813143670',
                      major: '软件工程',
                      password: 'neptune.',
                      password_confirmation: 'neptune.')

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@ucas.edu.cn"
  password = "password"
  dept.students.create!(sno: '2018E80150611' + n.to_s,
                        name: name,
                        email: email,
                        gender: '男',
                        enrolled_date: '2018-09-01',
                        birth_date: '1992-12-02',
                        degree: '博士',
                        phone: '18813143670',
                        major: 'Software Engineering',
                        password: password,
                        password_confirmation: password,)
end

dept.teachers.create!(tno: '200010101000',
                      name: '胡伟武',
                      email: 'hww@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.teachers.create!(tno: '200010101001',
                      name: '汪文祥',
                      email: 'wwx@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.teachers.create!(tno: '200010101102',
                      name: '黄庆明',
                      email: 'hqm@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.teachers.create!(tno: '200010101003',
                      name: '魏峻',
                      email: 'wj@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.teachers.create!(tno: '200010101004',
                      name: '卜东波',
                      email: 'bdb@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.teachers.create!(tno: '200010101005',
                      name: '刘莹',
                      email: 'ly@ucas.edu.cn',
                      gender: '女',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.teachers.create!(tno: '200010101006',
                      name: '罗铁坚',
                      email: 'ltj@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.teachers.create!(tno: '200010101007',
                      name: '马丙鹏',
                      email: 'mbp@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.teachers.create!(tno: '200010101008',
                      name: '林东岱',
                      email: 'ldd@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.teachers.create!(tno: '200010101009',
                      name: '吴保峰',
                      email: 'wbf@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.teachers.create!(tno: '200010101010',
                      name: '张老师',
                      email: 'zzzz@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.teachers.create!(tno: '200010101011',
                      name: '李老师',
                      email: 'lll@ucas.edu.cn',
                      gender: '女',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '副研究员')

dept.teachers.create!(tno: '200010101012',
                      name: '黄老师',
                      email: 'hhh@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '副研究员')

dept.teachers.create!(tno: '200010101013',
                      name: '王老师',
                      email: 'www@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '副研究员')

dept.teachers.create!(tno: '200010101014',
                      name: '赵老师',
                      email: 'zzz@ucas.edu.cn',
                      gender: '女',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '副研究员')

dept.teachers.create!(tno: '200010101015',
                      name: '杨老师',
                      email: 'yyy@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.teachers.create!(tno: '200010101016',
                      name: '钱老师',
                      email: 'qqq@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.teachers.create!(tno: '200010101017',
                      name: '周老师',
                      email: 'zzzzz@ucas.edu.cn',
                      gender: '女',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.teachers.create!(tno: '200010101018',
                      name: '吴老师',
                      email: 'wwwwww@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '副研究员')

dept.teachers.create!(tno: '200010101019',
                      name: '孙老师',
                      email: 'sssss@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.teachers.create!(tno: '200010101020',
                      name: '郑老师',
                      email: 'zls@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '副研究员')

dept.courses.create!(cno: '091M4001H',
                     title: '计算机体系结构',
                     year: 2018,
                     semester: '秋季',
                     credit: 3,
                     start_week: 2,
                     end_week: 20,
                     select_limit: 300,
                     hours: 60,
                     course_type: '专业核心课',
                     week_time_classroom: '2-20周,周一,9-11节,教1-107;14周,周六,6-8节,教1-101',
                     brief: '本课程为计算机科学与技术学科研究生的专业核心课。本课程重点论述计算机系统的各种基本结构、设计技术和性能分析方法。\n课程的目的及任务是：使学生通过本课程的学习，了解计算机系统的各种基本结构，掌握在计算机设计的各个环节中影响性能的因素，以及提高性能的各种理论和方法，并通过定量分析技术为设计的整体和局部的性能进行科学评价。')

dept.courses.create!(cno: '091M4042H-1',
                     title: '模式识别与机器学习',
                     year: 2018,
                     semester: '秋季',
                     credit: 3,
                     start_week: 2,
                     end_week: 20,
                     select_limit: 300,
                     hours: 60,
                     course_type: '专业核心课',
                     week_time_classroom: '2-20周,周一,5-7节,教1-002;12周,周六,2-4节,教1-101',
                     brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

dept.courses.create!(cno: '091M4042H-2',
                     title: '高级软件工程',
                     year: 2018,
                     semester: '秋季',
                     credit: 3,
                     start_week: 2,
                     end_week: 20,
                     select_limit: 150,
                     hours: 60,
                     course_type: '专业核心课',
                     week_time_classroom: '2-20周,周一,3-4节,教1-207;2-20周,周三,3-4节,教1-207',
                     brief: '本课程为计算机科学与技术学科研究生的学科基础课。本课程主要讲解当今软件工程面临的新问题以及为解决这些问题的新技术发展，包括需求工程、软件设计、软件过程、软件质量等。通过本课程的学习，使学生能充分理解当今软件工程的最新发展，并增强实际系统设计的能力。')

dept.courses.create!(cno: '091M4041H',
                     title: '计算机算法设计与分析',
                     year: 2018,
                     semester: '秋季',
                     credit: 3,
                     start_week: 2,
                     end_week: 20,
                     select_limit: 500,
                     hours: 60,
                     course_type: '专业核心课',
                     week_time_classroom: '2-20周,周五,2-4节,教1-101',
                     brief: '本课程为计算机应用学科研究生的专业核心课程。本课程讲授和讨论计算机算法前沿研究领域的主要思想和关键技术。主要内容有算法分析技术、分治法、动态规划法、贪心法、线性规划的单纯形法和对偶法、网络流、多项式归约、NP难问题、近似算法、随机算法、参数化算法和树分解、启发式方法（局部搜索）等。通过本课程的学习，希望学生能了解计算机算法前沿研究领域，了解算法设计与分析的最新研究成果，掌握基本思想和关键技术，培养学生三个方面的能力，即将实际问题抽象成算法问题的建模能力、观察问题特性并相应设计算法的能力，以及分析算法性能的能力。')

dept.courses.create!(cno: '091M5023H',
                     title: '数据挖掘',
                     year: 2018,
                     semester: '秋季',
                     credit: 2,
                     start_week: 2,
                     end_week: 20,
                     select_limit: 300,
                     hours: 40,
                     course_type: '专业选修课',
                     week_time_classroom: '2-16周,周三,1-2节,教1-101;2-16周,周一,1-2节,教1-101',
                     brief: '本课程为计算机软件学科研究生的专业普及课程。主要介绍数据挖掘技术的起源、原理、主要算法、关键技术等。课程包含的主要议题包括：数据挖掘的重要性、特点、应用领域、数据仓库、数据预处理技术、关联规则、分类、预测、聚类、顺序模式、深度学习、大数据挖掘等。本课程采用全英文教学，并将注重理论与实践相结合，使计算机专业研究生掌握数据挖掘的概念的同时，锻炼解决实际问题的能力，为将来的科研工作奠定基础。')

dept.courses.create!(cno: '14MGX019H',
                     title: '中国近代史专题',
                     year: 2018,
                     semester: '秋季',
                     credit: 1,
                     start_week: 2,
                     end_week: 20,
                     select_limit: 150,
                     hours: 40,
                     course_type: '公共选修课',
                     week_time_classroom: '2-16周,周二,9-11节,教1-306',
                     brief: '《中国近现代史专题》是面向全校研究生开设的通选课程。该课程依照历史的发展脉络，主要讲授中国近现代史学科的重要研究专题，涉及社会、文化、教育经济、政治等方面，讲授专题包括近现代中国社会结构的变迁与文化的转型、西学东渐、灾荒与近代中国、留学与近现代中国学科发展问题、传教士与近代中国、新型职业群体的产生、现代中国学术体制的创建与发展等等。通过该课程的学习，使学生在掌握中国近现代历史发展梗概的基础上，对中国历史的发展进程有更多层次、更多维度的认知，从而使学生对中国历史发展与当代社会有更加深入的理解与思考。 ')


dept.courses.create!(cno: '15MGB001H',
                     title: '英语A',
                     year: 2018,
                     semester: '秋季',
                     credit: 3,
                     start_week: 2,
                     end_week: 20,
                     select_limit: 50,
                     hours: 36,
                     course_type: '公共必修课',
                     week_time_classroom: '2-16周,周二,1-2节,学园1-101',
                     brief: ' ')


dept.courses.create!(cno: '23MGB001H-12',
                     title: '中国特色社会主义理论与实践研究（西区）',
                     year: 2018,
                     semester: '秋季',
                     credit: 2,
                     start_week: 2,
                     end_week: 20,
                     select_limit: 300,
                     hours: 36,
                     course_type: '公共必修课',
                     week_time_classroom: '2-12周,周四,5-8节,学园1-101',
                     brief: '本课程是全校硕士研究生的思想政治理论必修课，要在当代世界和当代中国的背景下，分专题探讨中国特色社会主义实践中的重大理论和现实问题，使学生进一步掌握中国特色社会主义理论体系，坚定中国特色社会主义信念。 ')

dept.courses.create!(cno: '201M4002H',
                     title: '应用密码学',
                     year: 2018,
                     semester: '秋季',
                     credit: 3,
                     start_week: 2,
                     end_week: 20,
                     select_limit: 150,
                     hours: 60,
                     course_type: '专业核心课',
                     week_time_classroom: '2-20周,周二,5-7节,学园1-207',
                     brief: '本课程为信息安全学科研究生的专业核心课。本课程讲授和讨论密码学前沿研究领域的主要思想和关键技术。主要内容有密码学的概念与需求、经典密码学、密码学的信息论基础、序列密码、分组密码、消息认证码与杂凑函数、公钥密码、数字签名、安全协议等。通过本课程的学习，希望学生能了解密码学的前沿研究领域，了解密码学的最新研究成果，掌握基本思想和关键技术，培养学生在密码学方面理论与实践相结合的学习方法和研究能力。 ')

dept.courses.create!(cno: '27MGX007H',
                     title: '西方艺术鉴赏',
                     year: 2018,
                     semester: '秋季',
                     credit: 1,
                     start_week: 2,
                     end_week: 17,
                     select_limit: 150,
                     hours: 42,
                     course_type: '公共选修课',
                     week_time_classroom: '2-17周,周一,5-7节,学园1-207',
                     brief: ' ')

dept.courses.create!(cno: '091M4201H',
                     title: '计算机网络',
                     year: 2018,
                     semester: '秋季',
                     credit: 3,
                     start_week: 2,
                     end_week: 20,
                     select_limit: 300,
                     hours: 60,
                     course_type: ' 专业选修课 ',
                     week_time_classroom: ' 2-20周,周三,5-7节,学园1-103',
                     brief: ' ')

dept.courses.create!(cno: '091M333H',
                     title: '网络数据挖掘',
                     year: 2018,
                     semester: '秋季',
                     credit: 3,
                     start_week: 2,
                     end_week: 20,
                     select_limit: 300,
                     hours: 60,
                     course_type: '专业选修课',
                     week_time_classroom: '2-20周,周二,5-7节,学园1-103',
                     brief: ' ')

dept.courses.create!(cno: '091M4202H',
                     title: '数据结构',
                     year: 2018,
                     semester: '秋季',
                     credit: 2,
                     start_week: 2,
                     end_week: 20,
                     select_limit: 300,
                     hours: 60,
                     course_type: '专业选修课',
                     week_time_classroom: '2-20周,周三,5-7节,学园1-304',
                     brief: ' ')

Teacher.first.courses << Course.first
Teacher.second.courses << Course.first
Teacher.third.courses << Course.second
Teacher.fourth.courses << Course.third
Teacher.fifth.courses << Course.fourth
Teacher.find(6).courses << Course.fifth
Teacher.find(7).courses << Course.third
Teacher.find(8).courses << Course.fifth
Teacher.find(9).courses << Course.find(6)
Teacher.find(10).courses << Course.find(9)
Teacher.find(11).courses << Course.find(10)
Teacher.find(12).courses << Course.find(11)
Teacher.find(13).courses << Course.find(12)
Teacher.find(14).courses << Course.find(13)
Teacher.find(15).courses << Course.find(12)
Teacher.find(16).courses << Course.find(1)
Teacher.find(17).courses << Course.find(2)
Teacher.find(18).courses << Course.find(5)
Teacher.find(19).courses << Course.find(7)
Teacher.find(20).courses << Course.find(8)


dept1 = Department.find_by(name: '数学科学学院')

dept1.teachers.create!(tno: '20001010100',
                       name: '胡老师',
                       email: 'hww1@ucas.edu.cn',
                       gender: '男',
                       phone: '',
                       birth_date: '1968-11-01',
                       password: 'neptune.',
                       password_confirmation: 'neptune.',
                       title: '研究员')

dept1.teachers.create!(tno: '200010101002',
                       name: '胡老师',
                       email: '123@ucas.edu.cn',
                       gender: '男',
                       phone: '',
                       birth_date: '1968-11-01',
                       password: 'neptune.',
                       password_confirmation: 'neptune.',
                       title: '研究员')

dept1.courses.create!(cno: '091M40422222',
                      title: '模式识别与机器学习',
                      year: 2018,
                      semester: '秋季',
                      credit: 3,
                      start_week: 2,
                      end_week: 20,
                      select_limit: 300,
                      hours: 60,
                      course_type: '专业核心课',
                      week_time_classroom: '2-20周,周一,5-7节,教1-002;18周,周六,2-4节,教1-101',
                      brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '20001010100').courses << Course.find_by(cno: '091M40422222')
Teacher.find_by(tno: '200010101002').courses << Course.find_by(cno: '091M40422222')

dept2 = Department.find_by(name: '物理科学学院')


dept2.teachers.create!(tno: '200010101103',
                       name: '王老师',
                       email: '124@ucas.edu.cn',
                       gender: '男',
                       phone: '',
                       birth_date: '1968-11-01',
                       password: 'neptune.',
                       password_confirmation: 'neptune.',
                       title: '研究员')


dept2.courses.create!(cno: '091M404222',
                      title: '高等力学课',
                      year: 2018,
                      semester: '秋季',
                      credit: 3,
                      start_week: 2,
                      end_week: 20,
                      select_limit: 300,
                      hours: 60,
                      course_type: '专业核心课',
                      week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                      brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '200010101103').courses << Course.find_by(cno: '091M404222')

dept3 = Department.find_by(name: '天文与空间科学学院')

dept3.teachers.create!(tno: '200010101021',
                       name: '徐老师',
                       email: '125@ucas.edu.cn',
                       gender: '男',
                       phone: '',
                       birth_date: '1968-11-01',
                       password: 'neptune.',
                       password_confirmation: 'neptune.',
                       title: '研究员')


dept3.courses.create!(cno: '091M40422592',
                      title: '天文空间学课',
                      year: 2018,
                      semester: '秋季',
                      credit: 3,
                      start_week: 2,
                      end_week: 20,
                      select_limit: 300,
                      hours: 60,
                      course_type: '专业核心课',
                      week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                      brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '200010101021').courses << Course.find_by(cno: '091M40422592')


dept4 = Department.find_by(name: '工程科学学院')

dept4.teachers.create!(tno: '200010101022',
                       name: '王老师',
                       email: '126@ucas.edu.cn',
                       gender: '男',
                       phone: '',
                       birth_date: '1968-11-01',
                       password: 'neptune.',
                       password_confirmation: 'neptune.',
                       title: '研究员')


dept4.courses.create!(cno: '091M404222-1',
                      title: '工程学课',
                      year: 2018,
                      semester: '秋季',
                      credit: 3,
                      start_week: 2,
                      end_week: 20,
                      select_limit: 300,
                      hours: 60,
                      course_type: '专业选修课',
                      week_time_classroom: '5-20周,周二,3-4节,教1-003;15周,周四,3-4节,教2-101',
                      brief: ''
)
Teacher.find_by(tno: '200010101022').courses << Course.find_by(cno: '091M404222-1')

dept5 = Department.find_by(name: '人工智能学院')

dept5.teachers.create!(tno: '200010101023',
                       name: '文老师',
                       email: '127@ucas.edu.cn',
                       gender: '男',
                       phone: '',
                       birth_date: '1968-11-01',
                       password: 'neptune.',
                       password_confirmation: 'neptune.',
                       title: '研究员')


dept5.courses.create!(cno: '091M4222-12',
                      title: '人工智能课',
                      year: 2018,
                      semester: '秋季',
                      credit: 3,
                      start_week: 2,
                      end_week: 20,
                      select_limit: 300,
                      hours: 60,
                      course_type: '专业讨论课',
                      week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                      brief: ''
)
Teacher.find_by(tno: '200010101023').courses << Course.find_by(cno: '091M4222-12')

dept6 = Department.find_by(name: '化学科学学院')

dept6.teachers.create!(tno: '200010101024',
                       name: '海老师',
                       email: '128@ucas.edu.cn',
                       gender: '男',
                       phone: '',
                       birth_date: '1968-11-01',
                       password: 'neptune.',
                       password_confirmation: 'neptune.',
                       title: '研究员')


dept6.courses.create!(cno: '091M40482',
                      title: '化学科学课',
                      year: 2018,
                      semester: '秋季',
                      credit: 3,
                      start_week: 2,
                      end_week: 20,
                      select_limit: 300,
                      hours: 60,
                      course_type: '专业必修课',
                      week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                      brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '200010101024').courses << Course.find_by(cno: '091M40482')

dept7 = Department.find_by(name: '材料科学与光电技术学院')

dept7.teachers.create!(tno: '200010101025',
                       name: '越老师',
                       email: 'www129@ucas.edu.cn',
                       gender: '男',
                       phone: '',
                       birth_date: '1968-11-01',
                       password: 'neptune.',
                       password_confirmation: 'neptune.',
                       title: '研究员')


dept7.courses.create!(cno: '091M4031-2',
                      title: '材料学课',
                      year: 2018,
                      semester: '秋季',
                      credit: 3,
                      start_week: 2,
                      end_week: 20,
                      select_limit: 300,
                      hours: 60,
                      course_type: '专业必修课',
                      week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                      brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '200010101025').courses << Course.find_by(cno: '091M4031-2')


dept8 = Department.find_by(name: '光电学院')

dept8.teachers.create!(tno: '200010101026',
                       name: '谭老师',
                       email: 'www130@ucas.edu.cn',
                       gender: '男',
                       phone: '',
                       birth_date: '1968-11-01',
                       password: 'neptune.',
                       password_confirmation: 'neptune.',
                       title: '研究员')


dept8.courses.create!(cno: '091M4042-52',
                      title: '光电学课',
                      year: 2018,
                      semester: '秋季',
                      credit: 3,
                      start_week: 2,
                      end_week: 20,
                      select_limit: 300,
                      hours: 60,
                      course_type: '专业核心课',
                      week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                      brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '200010101026').courses << Course.find_by(cno: '091M4042-52')


dept9 = Department.find_by(name: '纳米科学与技术学院')

dept9.teachers.create!(tno: '200010101027',
                       name: '万老师',
                       email: 'www131@ucas.edu.cn',
                       gender: '男',
                       phone: '',
                       birth_date: '1968-11-01',
                       password: 'neptune.',
                       password_confirmation: 'neptune.',
                       title: '研究员')


dept9.courses.create!(cno: '091M404622-13',
                      title: '纳米科学课',
                      year: 2018,
                      semester: '秋季',
                      credit: 3,
                      start_week: 2,
                      end_week: 20,
                      select_limit: 300,
                      hours: 60,
                      course_type: '专业核心课',
                      week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                      brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '200010101027').courses << Course.find_by(cno: '091M404622-13')

dept10 = Department.find_by(name: '地球与行星科学学院')

dept10.teachers.create!(tno: '200010101028',
                        name: '语老师',
                        email: 'www132@ucas.edu.cn',
                        gender: '男',
                        phone: '',
                        birth_date: '1968-11-01',
                        password: 'neptune.',
                        password_confirmation: 'neptune.',
                        title: '研究员')


dept10.courses.create!(cno: '091M40452-123',
                       title: '地球与行星课',
                       year: 2018,
                       semester: '秋季',
                       credit: 3,
                       start_week: 2,
                       end_week: 20,
                       select_limit: 300,
                       hours: 60,
                       course_type: '专业讨论课',
                       week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                       brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '200010101028').courses << Course.find_by(cno: '091M40452-123')

dept11 = Department.find_by(name: '资源与环境学院')

dept11.teachers.create!(tno: '200010101029',
                        name: '复老师',
                        email: 'www133@ucas.edu.cn',
                        gender: '男',
                        phone: '',
                        birth_date: '1968-11-01',
                        password: 'neptune.',
                        password_confirmation: 'neptune.',
                        title: '研究员')


dept11.courses.create!(cno: '091M4042-62',
                       title: '资源与环境课',
                       year: 2018,
                       semester: '秋季',
                       credit: 3,
                       start_week: 2,
                       end_week: 20,
                       select_limit: 300,
                       hours: 60,
                       course_type: '专业核心课',
                       week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                       brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '200010101029').courses << Course.find_by(cno: '091M4042-62')

dept12 = Department.find_by(name: '生命科学学院')

dept12.teachers.create!(tno: '200010101030',
                        name: '时老师',
                        email: 'www134@ucas.edu.cn',
                        gender: '男',
                        phone: '',
                        birth_date: '1968-11-01',
                        password: 'neptune.',
                        password_confirmation: 'neptune.',
                        title: '研究员')


dept12.courses.create!(cno: '091M40428-1',
                       title: '生命科学课',
                       year: 2018,
                       semester: '秋季',
                       credit: 3,
                       start_week: 2,
                       end_week: 20,
                       select_limit: 300,
                       hours: 60,
                       course_type: '专业核心课',
                       week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                       brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '200010101030').courses << Course.find_by(cno: '091M40428-1')

dept13 = Department.find_by(name: '现代农业科学学院')

dept13.teachers.create!(tno: '200010101031',
                        name: '魏老师',
                        email: 'www135@ucas.edu.cn',
                        gender: '男',
                        phone: '',
                        birth_date: '1968-11-01',
                        password: 'neptune.',
                        password_confirmation: 'neptune.',
                        title: '研究员')


dept13.courses.create!(cno: '181M404222',
                       title: '农业学课',
                       year: 2018,
                       semester: '秋季',
                       credit: 3,
                       start_week: 2,
                       end_week: 20,
                       select_limit: 300,
                       hours: 60,
                       course_type: '专业核心课',
                       week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                       brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '200010101031').courses << Course.find_by(cno: '181M404222')

dept14 = Department.find_by(name: '存济医学院')

dept14.teachers.create!(tno: '200010101032',
                        name: '开老师',
                        email: 'www136@ucas.edu.cn',
                        gender: '男',
                        phone: '',
                        birth_date: '1968-11-01',
                        password: 'neptune.',
                        password_confirmation: 'neptune.',
                        title: '研究员')


dept14.courses.create!(cno: '091M4062-76',
                       title: '医学课',
                       year: 2018,
                       semester: '秋季',
                       credit: 3,
                       start_week: 2,
                       end_week: 20,
                       select_limit: 300,
                       hours: 60,
                       course_type: '专业核心课',
                       week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                       brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '200010101032').courses << Course.find_by(cno: '091M4062-76')


dept16 = Department.find_by(name: '网络空间安全学院')

dept16.teachers.create!(tno: '200010101033',
                        name: '将老师',
                        email: 'www137@ucas.edu.cn',
                        gender: '男',
                        phone: '',
                        birth_date: '1968-11-01',
                        password: 'neptune.',
                        password_confirmation: 'neptune.',
                        title: '研究员')


dept16.courses.create!(cno: '091M4633-2',
                       title: '网络空间课',
                       year: 2018,
                       semester: '秋季',
                       credit: 3,
                       start_week: 2,
                       end_week: 20,
                       select_limit: 300,
                       hours: 60,
                       course_type: '专业核心课',
                       week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                       brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '200010101033').courses << Course.find_by(cno: '091M4633-2')

dept17 = Department.find_by(name: '电子电气与通信工程学院')

dept17.teachers.create!(tno: '200010101034',
                        name: '金老师',
                        email: 'www138@ucas.edu.cn',
                        gender: '男',
                        phone: '',
                        birth_date: '1968-11-01',
                        password: 'neptune.',
                        password_confirmation: 'neptune.',
                        title: '研究员')


dept17.courses.create!(cno: '091M4522-97',
                       title: '电子电气课',
                       year: 2018,
                       semester: '秋季',
                       credit: 3,
                       start_week: 2,
                       end_week: 20,
                       select_limit: 300,
                       hours: 60,
                       course_type: '专业核心课',
                       week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                       brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '200010101034').courses << Course.find_by(cno: '091M4522-97')

dept18 = Department.find_by(name: '微电子学院')

dept18.teachers.create!(tno: '200010101035',
                        name: '鹤老师',
                        email: 'www139@ucas.edu.cn',
                        gender: '男',
                        phone: '',
                        birth_date: '1968-11-01',
                        password: 'neptune.',
                        password_confirmation: 'neptune.',
                        title: '研究员')


dept18.courses.create!(cno: '091M4622-001',
                       title: '微电子学课',
                       year: 2018,
                       semester: '秋季',
                       credit: 3,
                       start_week: 2,
                       end_week: 20,
                       select_limit: 300,
                       hours: 60,
                       course_type: '专业核心课',
                       week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                       brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '200010101035').courses << Course.find_by(cno: '091M4622-001')

dept19 = Department.find_by(name: '核科学与技术学院')

dept.teachers.create!(tno: '200010101036',
                      name: '邹老师',
                      email: 'www140@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')


dept19.courses.create!(cno: '091M4022-111',
                       title: '核科学课',
                       year: 2018,
                       semester: '秋季',
                       credit: 3,
                       start_week: 2,
                       end_week: 20,
                       select_limit: 300,
                       hours: 60,
                       course_type: '专业核心课',
                       week_time_classroom: '2-18周,周二,3-4节,教1-002;16周,周四,3-4节,教2-101',
                       brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。 ')

Teacher.find_by(tno: '200010101036').courses << Course.find_by(cno: '091M4022-111')

