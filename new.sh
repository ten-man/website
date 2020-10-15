# hugo new --kind post post/"$1"


# 语法： hugo new blog/#目录/#文章文件夹/#文件名.md
# 例子： hugo new blog/news/架构设计/软件系统架构设计.md
# 新创建的文章。头部有draft:true 字段，则默认是不显示的，改成false，变成正式发布的文章
# 
hugo new --kind post blog/news/"$1"/"$1".md
