# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Department.create!(dno: 'CS', name: '计算机与控制学院')

dept = Department.first

dept.students.create!(sno:'2018E8015061016',
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
  name  = Faker::Name.name
  email = "example-#{n+1}@ucas.edu.cn"
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

dept.teachers.create!(tno: '200010101002',
                      name: '黄庆明',
                      email: 'hqm@ucas.edu.cn',
                      gender: '男',
                      phone: '',
                      birth_date: '1968-11-01',
                      password: 'neptune.',
                      password_confirmation: 'neptune.',
                      title: '研究员')

dept.courses.create!(cno:'091M4001H',
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

dept.courses.create!(cno:'091M4042H-1',
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
                     brief: '本课程为计算机应用技术学科研究生的专业核心课课，同时也可作为计算机其它专业及电子、自动化等学科研究生的专业普及课。本课程将讲述模式识别与机器学习的基本概念、基本理论和方法、关键算法原理以及典型应用情况。主要内容包括统计判别、判别函数、特征选择、句法模式识别、有监督学习、支持向量机、无监督/半监督学习、图模型、集成学习、神经网络与深度学习以及人脸识别案例分析等。
通过本课程的学习，希望学生能了解模式识别与机器学习前沿研究领域，了解相关理论与方法在计算机视觉等领域应用的最新研究成果，掌握基本思想和关键技术，培养学生在计算机视觉、模式识别和机器学习领域的研究能力。 ')

Teacher.first.courses << Course.first
Teacher.second.courses << Course.first
Teacher.third.courses << Course.second

