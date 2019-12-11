jobsList = ['job1', 'job2', 'job3', 'job4', 'job5', 'job6', 'job7', 'job8']

// Create a map value that contains a stage that runs input command.
def createDynamicJob(jobName, command)
{
    mapItem = {
                stage("Dynamic job")
                {
                    node
                    {
                        stage("Internal stage")
                        {
			    #unstash 'TestDataFolder'
			    sh "ls -l /mnt"
			    sh "ls -l /mnt/TestData"
			    sh "echo ${jobName}"
			    unstash 'square_root.sh'
			    sh "${command}"
                        }
                    }
                }
            }

    return mapItem
}

def returnParallelJobs()
{
    def jobsMap = [:]

    for (jobName in jobsList)
    {  
        // Build job.
        newJob = createDynamicJob(jobName, "sh square_root.sh")
        jobsMap.put(jobName, newJob)
    }

    return jobsMap;
}

pipeline
{
    agent { label 'ubuntu' }

    stages
    {
        stage('Build')
        {
            steps
            {
                sh 'echo Testing first JenkinsFile'
		stash includes: 'square_root.sh', name: 'square_root.sh'
		#stash includes: '/mnt/TestData', name: 'TestDataFolder'
            }
        }

        stage('Start several jobs')
        {
/*
            steps
            {
                sh 'ls -l /mnt'
		sh 'ls -l /mnt/TestData'
                sh 'cat /mnt/TestData/TestData.txt'
            }
	    */
            when
            {
                anyOf { branch 'Feat_001_Start_Several_Jobs'}
            }
            steps
            {
                script
                {
                    parallel(returnParallelJobs())
                }
            }
        }
    }
}

