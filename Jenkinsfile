@Library("JenkinsPipelines") _ // See https://github.com/mwdle/JenkinsPipelines

boolean disableIndexTriggers = env.BRANCH_NAME != 'main'

quadletPipeline(
    agentLabel: 'persistent',
    disableIndexTriggers: disableIndexTriggers,
    podmanSecretMappings: [
        [
            type: 'usernamePassword',
            credentialsId: 'Jenkins',
            podmanSecretUsernameName: 'jenkins_admin_username',
            podmanSecretPasswordName: 'jenkins_admin_password'
        ],
        [
            type: 'usernamePassword',
            credentialsId: 'Forgejo PAT',
            podmanSecretUsernameName: 'jenkins_git_username',
            podmanSecretPasswordName: 'jenkins_git_token'
        ],
        [
            type: 'usernamePassword',
            credentialsId: 'Email noreply',
            podmanSecretUsernameName: 'lab_smtp_username',
            podmanSecretPasswordName: 'lab_smtp_password'
        ],
        [
            type: 'string',
            credentialsId: 'jenkins_alert_email'
        ]
    ]
)
