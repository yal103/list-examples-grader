CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
files=`find student-submission/*.java`
for file in $files
do
    if [[ -f $file && $file == student-submission/ListExamples.java ]]
    then
    echo $file
        echo "File exists"
    else
        echo "Wrong file"
        exit
    fi
done

cp -r student-submission/*.java lib/*.jar TestListExamples.java grading-area
javac -cp $CPATH grading-area/*.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples


