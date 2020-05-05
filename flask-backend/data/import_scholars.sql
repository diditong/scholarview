CREATE TABLE scholars (
    scId INT NOT NULL AUTO_INCREMENT,
    biography LONGTEXT,
    scName VARCHAR(255),
    bsSchool VARCHAR(255),
    bsYear INT,
    msSchool VARCHAR(255),
    msYear INT,
    phdSchool VARCHAR(255),
    phdYear INT,
    interest1 VARCHAR(255),
    interest2 VARCHAR(255),
    interest3 VARCHAR(255),
    teaching1 VARCHAR(255),
    teaching2 VARCHAR(255),
    teaching3 VARCHAR(255),
    PRIMARY KEY (scId)
);

INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (1,'Abdussalam Alawini','I am a teaching assistant professor in the Department of Computer Science at The University of Illinois at Urbana-Champaign. My research interests are broadly in the field of databases, with a focus on data management. I am particularly interested in applying machine learning methods to various problems of modern data management systems. I am also interested in CS education research.','University of Tripoli',2002,'Portland State University',2011,'Portland State University',2016,'Data Provenance','Data Citation','Computers and Education','CS411: Database Systems',NULL,NULL);
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (2,'Jeff Erickson','I''m a computational geometer/topologist/graphophile with more general interests in algorithms, data structures, and lower bounds. I have the lowest undergraduate GPA (2.4/4.0) of any professor I''ve ever met, although some of my colleagues came close, and a few others never finished college at all. (I really shouldn''t be proud of that.) Only three other professors have been in my department longer than I have. (I really shouldn''t be proud of that, either.) I teach mostly large algorithms classes; you might find my free textbook and other course materials useful. From 2013 to 2016, I was an associate department head and chair of the faculty recruiting committee. I am a SafeTOC advocate.','Rice University',1987,'University of California, Irvine',1992,'University of California, Berkeley',1996,'Algorithms','Data Structures','Computational Geometry','CS374: Algorithms and Model of Computation','CS473: Algorithms',NULL);
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (3,'Edgar Solomonik','Distinguished Professor at UIUC with primary interest in Scientific Computing','University of Illinois, Urbana-Champaign',2010,NULL,NULL,'University of California, Berkeley',2014,'Linear Algebra','Parallel Programming','Scientific Computing','CS598: Probably Efficient Algorithms for Numerical and Combinatorial Problems','CS554: Parallel Numerical Algorithms','CS450: Numerical Analysis');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (4,'Elsa Gunter','My research interests are formal methods; programming languages; software engineering; design and use of automated and interactive theorem provers; mathematical semantics of programming languages; formal reasoning about human-computer systems; formal reasoning about security; proof theory and type theory','University of Chicago',1979,'University of Wisconsin, Madison',1981,'University of Wisconsin, Madison',1987,'Programming Languages','Automation','Mathematic Semantics','CS101: Introduction to Computing','CS576: Topics in Automated Design','CS421: Programming Languages and Compilers');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (5,'Eric Shaffer','As instructional faculty at the University of Illinois, I teach a revolving set of courses including Interactive Computer Graphics, Production Rendering, Numerical Methods, Game Design, and Scientific Visualization. I have been named to the List of Instructors Ranked as Excellent by Their Students. My research includes work in the areas of network analytics, scientific computing, applied geometric computation, visualization, and parallel and high performance computing. I have worked with a variety of industrial partners, including Exxon-Mobil, the Boeing Company, and Caterpillar.','University of Illinois, Urbana-Champaign',1992,'University of Minnesota',1996,'University of Illinois, Urbana-Champaign',2005,'Computers and Education','Scientific Computing','Data Analytics','CS498: Applies Machine Learning','CS418: Interactive Computer Graphics','CS103: Introduction to Programming');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (6,'Karrie Karahalios','Kyratso (Karrie) G. Karahalios is an American computer scientist and professor in the Department of Computer Science, University of Illinois at Urbana-Champaign. She is noted for her work on the impact of computer science on people and society, analyses of social media, and algorithm auditing. She is co-founder of the Center for People and Infrastructures at the University of Illinois at Urbana-Champaign.','Massachussets Institute of Technology',1994,'Massachussets Institute of Technology',1995,'Massachussets Institute of Technology',2004,'Artificial Intelligence','Interactive Computing',NULL,'CS598: Social Computer Mediated Communication','CS591: Social Spaces','CS467: Social Computing');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (7,'Tarek Abdelzaher','I received my Ph.D. from the University of Michigan, Ann Arbor, in 1999, under Professor Kang Shin. I was an Asistant Professor at the University of Virginia from August 1999 to August 2005. I then joined the University of Illinois at Urbana Champaign as an Associate Professor with tenure, where I became Full Professor in 2011. My interests lie primarily in systems, including operating systems, networking, sensor networks, distributed systems, and embedded real-time systems. I am especially interested in developing theory, architectural support, and computing abstractions for predictability in software systems, motivated by the increasing software complexity and the growing sources of non-determinism. Applications range from sensor networks to large-scale server farms, and from transportation systems to medicine.',NULL,NULL,NULL,NULL,'University of Michigan, Ann Arbor',1999,'Internet of Things','Cyber-Physical Systems','Sensor Networks','CS423: Operating Systems','CS424: Real-time Systems','CS598:Sensor Networks');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (8,'Vikram Adve','Vikram Adve is the Donald B. Gillies Professor of Computer Science at the University of Illinois at Urbana-Champaign, and has affiliate appointments with the Coordinated Sciences Laboratory and the Information Trust Institute. Adve’s research interests lie in developing and using compiler techniques to improve the performance, programmability and reliability of computer systems. Adve and his Ph.D. student, Chris Lattner, co-designed the LLVM Compiler Infrastructure, which enables a novel approach to “lifelong compilation” of programs in a wide range of general-purpose programming languages. For example, most mobile apps for the iPhone, iPad, Apple Watch and Apple TV are shipped by developers to Apple in the LLVM compiler representation called “LLVM bitcode” and then compiled and specialized for the various end-user devices. LLVM is widely used in industry today, ranging from mobile devices (e.g., iOS and Android) to supercomputers (e.g., at NVIDIA, Cray, IBM and Intel) to data centers (e.g., at Google). Adve, Lattner and Evan Cheng received the ACM Software System Award in 2012 for co-developing LLVM. Adve has won a ten-year-retrospective Most Influential Paper award at CGO 2004, and distinguished paper awards at several conferences including PLDI 2005, SOSP 2007 and ICSE 2011. He has served as the Associate Editor for the ACM Transactions on Programming Languages and Systems, and co-chaired the Program Committees for ASPLOS 2010, VEE 2008, and LCPC 2007. One of Adve’s Ph.D. students, Robert Bocchino, won the 2010 ACM SIGPLAN Outstanding Dissertation Award and another student, John Criswell, won Honorable Mentions for both the 2014 ACM SIGOPS Dissertation Award and the 2014 ACM Doctoral Dissertation Award. Adve is a Fellow of the ACM and was named a University Scholar at the University of Illinois in 2015. He served as Interim Head of the Computer Science Department from 2017 to 2019.','Indian Institute of Technology, Bombay',1987,NULL,NULL,'University of Wisconsin-Madison',1993,'Compilers','Parrallel Programming','Software Security','CS426: Compiler Construction','CS526: Advanced Compiler Construction','CS421: Programming Languages and Compilers');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (9,'Nancy Amato','Nancy M. Amato is Head of the Department of Computer Science and Abel Bliss Professor of Engineering at the University of Illinois at Urbana-Champaign. Previously, she was Unocal Professor and Regents Professor in the Department of Computer Science and Engineering at Texas A&M University where she co-directed the Parasol Lab. She was also Senior Director of Engineering Honors Programs in the College of Engineering and Co-Coordinator of the Computer Science and Engineering Track of Engineering Honors.','Stanford University',1986,'University of California, Berkeley',1988,'University of Illinois, Urbana-Champaign',1995,'Artificial Intelligence','Computational Biology',NULL,NULL,NULL,NULL);
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (10,'Brian Bailey','My research lies within the field of human-computer interaction. I believe there are many open problems in computing that are best addressed through understanding of human behavior and many pressing problems in society that can be newly addressed through creative applications of computing. My current research interests include developing interactive tools that foster human creativity; systems that improve interruption management, and user interfaces for multiple display environments. If you are interested in any of these research topics, please contact me about project opportunities. I have a few openings for M.S. and Ph.D. students in my group.','Purdue University',1993,'University of Minnesota',1997,'University of Minnesota',2002,'Interactive Computing','Human-Computer Interations','Display Environments','CS465: User Interface Design','CS498: Mobile Interactive Design','CS565: Topics in Himan-Computer Interaction');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (11,'Adam Bates','I am an Assistant Professor at the University of Illinois at Urbana-Champaign, where I lead the Secure & Transparent Systems Laboratory. My research confronts a broad array of issues in computer security including operating systems, cloud computing, and network communications, as well as both mobile and embedded devices. My recent work has evaluated the safety of mobile applications, introduced mechanisms that defend against USB-based attacks, and designed security-enhanced provenance-aware systems that are capable of reliably tracking and explaining system intrusions.','University of Maryland',2006,'University of Oregon',2012,'University of Florida',2016,'Computer Security','Operating Systems','Cloud Computing','CS563: Advanced Computer Security','CS 461: Computer Security 1','CS423: Operating Systems Design');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (12,'Mattox Alan Beckman','Dr Mattox Beckman is a teaching assistant professor in the CS department at the University of Illinois at Urbana-Champaign (UIUC). Beckman received his PhD from UIUC in 2003, studying partial evaluation and programming languages. After graduating, Beckman taught at the Illinois Institute of Technology in Chicago from 2003 to 2015, where he taught data structures and programming languages. In 2015 he returned to Champaign county to teach at UIUC, where he lives with his wife and five year old daughter. His primary research focus in computer science education.','University of Illinois, Urbana-Champaign',1993,NULL,NULL,'University of Illinois , Urbana-Champaign',2003,'Programming Languages','Computers and Education',NULL,'CS225: Data Structures','CS591: Teaching Assistant Training','CS491: Advanced Competitive Algorithm Programming');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (13,'Marco Caccomo','In broad terms, his research interests are centered on the area of embedded systems. He has worked in close collaboration with avionics, farming, and automotive industries developing innovative software architectures and toolkits for the design automation of embedded digital controllers, and low-level resource management solutions for real-time operating systems running on multicore architectures. More recently, he has begun to investigate real-time, security, and robustness problems in the software architecture of unmanned aerial vehicles (UAVs).',NULL,NULL,'Univerita de Pisa',NULL,'Scuola Superiore Sant Anna di Studi Universitari e di Perfezionmento',2002,'Embedded Systems','Artificial Intelligence','Wireless Communication Systems','CS431: Embedded Systems','CS498: Cyber Physical-Systems','CS598: Cyber Physical-Systems Tech');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (14,'Geoffrey Challen','I teach computer science at the University of Illinois. Previously I led the blue Systems Research Group and directed the PhoneLab. My research interests are in systems and networking, mobile systems, smartphones, and computer science education. At the University at Buffalo I taught an introduction to computer operating systems, designed and deployed a new freshman course on the internet, designed two new introductory courses, and led a comprehensive overhaul of the computer science curriculum. At the University of Illinois. I teach an introduction to computer science.','Harvard University',2003,NULL,NULL,'Harvard University',2010,'Systems and Networking','Computer Science Education','Operating Systems','CS125: Introduction to Computer Science','CS497: CS Team Project',NULL);
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (15,'Timothy Chan','I am a Founder Professor in Computer Science. (Prior to joining UIUC, I taught at the Cheriton School of Computer Science, University of Waterloo from 1999 to 2016.)','Rice University',1992,NULL,NULL,'Ohio State University',1995,'Algorithms','Data Structures','Computational Geomertry','CS598: Geometric Data Structures',NULL,NULL);
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (16,'Kevin Chang','Kevin C.C. Chang is a Professor in Computer Science, University of Illinois at Urbana-Champaign, where he leads the FORWARD Data Lab for search, integration, and mining of data. He received a BS from National Taiwan University and PhD from Stanford University, in Electrical Engineering. His research addresses large scale information access, for search, mining, and integration across structured and unstructured big data, with current focuses on "entity-centric" Web search/mining and social media analytics. He received two Best Paper Selections in VLDB 2000 and 2013, an NSF CAREER Award in 2002, an NCSA Faculty Fellow Award in 2003, IBM Faculty Awards in 2004 and 2005, Academy for Entrepreneurial Leadership Faculty Fellow Award in 2008, and the Incomplete List of Excellent Teachers at University of Illinois in 2001, 2004, 2005, 2006, 2010, and 2011. He is passionate to bring research results to the real world and, with his students, co-founded Cazoodle, a startup from the University of Illinois, for deepening vertical "data-aware" search over the web.','National Taiwan University',1990,'Stanford',1995,'Stanford University',2000,'Databases and Information Systems','Artificial Intelligence','Query Processing','CS411: Database Systems','CS412: Introduction to Data Mining','CS511: Advanced Data Management');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (17,'Chandra Chekuri','Chandra Chekuri is an Associate Professor of Computer Science at the University of Illinois at Urbana-Champaign (UIUC). He obtained his Ph.D. in Computer Science at Stanford University under the supervision of Rajeev Motwani in 1998, and then worked at Lucent Bell Labs for eight years. His primary research interests are algorithms, combinatorial optimization, and mathematical programming.','Indian Institute of Technology, Madras',1993,NULL,NULL,'Stanford University',1998,'Theory and Algorithms','Discrete and Combinatorial Optimization','Mathematical Programming','CS598: Topics in Graph Algorithms','CS473: Algorithms','CS 374: Algorithms and Models of Computation');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (18,'Neal Davis','Neal Davis is Assistant Director of Training (Interim) for Computational Science and Engineering at the University of Illinois at Urbana–Champaign. He earned a Ph.D. in Nuclear Engineering studying the surface reactions of uranium metal. He conducts training across a range of traditional engineering software programs and packages. His professional interests include engineering pedagogy, computational materials science, and the history and philosophy of science.','Bringham Young University',2008,'University of Illinois, Urbana-Champaign',2011,'University of Illinois, Urbana-Champaign',2013,'Computational Materials Science','Automation','Philosophy of Science','CS101: Introduction to Computing',NULL,NULL);
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (19,'Mohammed El-Kebir','I was a postdoctoral research associate at Princeton University and Brown University advised by Dr. Ben Raphael. I received my PhD in October 2015 at Centrum Wiskunde & Informatica (CWI) and VU University Amsterdam in the Netherlands, where I was advised by Dr. Gunnar Klau and Dr. Jaap Heringa. Please see my CV for more details.','Eindhoven University of Technology',2006,'Vrije Universiteit Amsterdam',2010,'Vrije Universiteit Amsterdam',2015,'Bioinformatics','Inference Algorithms','Phylogenetics','CS466: Introduction to Bioinformatics','CS598: Computational Cancer Genomics',NULL);
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (20,'Wade A, Fagen-Ulmschneider','I believe that world-class education is education worth sharing. Working with students to create quality experiences that they''re proud to share, while they master their skills in Data Structures, Data Science, Data Discovery, and Data Visualization.','University of Texas, Dallas',2005,'University of Texas, Dallas',2006,'University of Illinois, Urbana-Champaign',2013,'Data Science','Data Structures','Data Visualization','CS107: Data Science Discovery','CS225: Data Structures','CS305: Data Driven Discovery');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (21,'Paul Fishcher','Interested In Computation and Applied Math, Energy, Environment, Fluid Mechanics, Health and Bio. Thermo and Heat Transfer, and Transportation','Cornell University',1981,'Stanford University',1982,'Massachusetts Institute of Technology',1989,'Applies Mathematics','Scientific Computing','Mechanics','CSE450: Computational Mechanics',NULL,NULL);
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (22,'Margaret Fleck','My research interests include computational linguistics, computer vision, and programming language tools to support language and vision research. Right now, I''m working on unsupervised algorithms that learn word boundaries from transcribed speech.','Yale University',1982,'Massachussets Institute of Technology',1985,'Massachusetts Institute of Technology',1988,'Programming Languages','Artificial Intelligence','Computational Linguistics','CS173: Discrete Structures','CS440: Artificial Intelligence','CS273: Introduction to Theory of Computation');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (23,'Christopher Fletcher','Hi there! My name is Chris Fletcher (a.k.a. ''Fletch'', ''C Fletch'', ''C F''). I am an Assistant Professor at the University of Illinois--Urbana Champaign (CS Department). I grew up in Southern California and moved to Berkeley in 2006 to pursue a Bachelor''s of Science in Electrical Engineering and Computer Science. I graduated with a Ph.D. (also in EECS) at MIT in 2016, and spent a year (Fall 2016-17) as a Research Post-doc at Nvidia.','University of California, Berkeley',2010,NULL,NULL,'Massachusetts Institute of Technology',2016,'Cloud Computing','Computer Architecture','Computer Security','CS433: Computer System Organization','CS563: Advanced Computer Security','CS598: Secure Processor Design');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (24,'Philip Godfrey','Godfrey is an Associate Professor in the Department of Computer Science at the University of Illinois at Urbana-Champaign. He co-founded and served as CTO of network verification pioneer Veriflow, through its 2019 acquisition by VMware where he now serves as a Technical Director. He received his Ph.D. at UC Berkeley in 2009, and his B.S. at Carnegie Mellon University in 2002. His research interests lie in the design of networked systems and algorithms. He is a winner of the ACM SIGCOMM Rising Star Award, the UIUC Dean''s Award for Excellence in Research, the Sloan Research Fellowship, an Internet2 Innovative Application Award, the National Science Foundation CAREER Award, and multiple best paper awards. He was a Beckman Fellow at the UIUC Center for Advanced Study in 2014-2015, and served as program committee co-chair of ACM HotNets 2014 and the Symposium on SDN Research 2016.','Carnegie Mellon University',2002,'University of California, Berkeley',2006,'University of California, Berkeley',2009,'Systems and Networking','Security and Privacy','Theory and Algorithms','CS538: Advanced Computer Networks','CS498: Cloud Networking','CS241: Systems Programming');
INSERT INTO scholars(scId,scName,biography,bsSchool,bsYear,msSchool,msYear,phdSchool,phdYear,interest1,interest2,interest3,teaching1,teaching2,teaching3) VALUES (25,'Bill Gropp','My interest is in the use of high performance computing to solve problems that are too hard for other techniques. I have concentrated in two areas: the development of scalable numerical algorithms for partial differential equations (PDEs), especially for the linear systems that arise from approximations to PDEs, and the development of programming models and systems for expressing and implementing highly scalable applications. In each of these areas, I have led the development of software that has been widely adopted. PETSc is a powerful numerical library for the solution of linear and nonlinear systems of equations. MPI is the mostly widely used parallel programming system for large scale scientific computing. The MPICH implementation of MPI is one of the most widely used and is the implementation of choice for the world''s fastest machines.','Case Western Reserve University',1977,'University of Washington',1978,'Stanford University',1982,'Scientific Computing','Parallel Computing','High Performance Computing','CS598: Designing and Building Applications for Extreme Scale Systems',NULL,NULL);