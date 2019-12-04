pipeline
{
    agent any

    stages
    {
        stage('Build')
        {
            steps
            {
                sh 'echo Testing first JenkinsFile'
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
                sh 'echo Start Several Jobs'
            }
        }
    }
}

