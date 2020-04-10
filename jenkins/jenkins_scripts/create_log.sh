FILE_NAME="D:/study/jenkins/jenkins_scripts/log_"`date +%Y_%m_%d`".log"
DATE_NOW=`date +%Y/%m/%d-%H:%M:%S`
echo "Creating txt file"
echo "Created by admin. Created time is $DATE_NOW" >  $FILE_NAME
echo "Completed"