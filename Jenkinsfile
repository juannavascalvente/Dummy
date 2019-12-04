jobsList = ['job1', 'job2', 'job3', 'job4', 'job5', 'job6']

// Create a map value that contains a stage that runs input command.
def createDynamicJob(jobName, nodeName, command)
{
    mapItem = {
                stage("Dynamic job")
                {
                    node(nodeName)
                    {
                        stage("Internal stage")
                        {
			    unstash 'square_root.sh'
			    sh "echo ${jobName}"
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
        newJob = createDynamicJob(jobName, "slave01", "sh square_root.sh")
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
            }
        }

        stage('Start several jobs')
        {
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

