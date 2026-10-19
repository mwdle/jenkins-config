boolean disableIndexTriggers = env.BRANCH_NAME != 'main'

quadletPipeline(
    agentLabel: 'persistent',
    disableIndexTriggers: disableIndexTriggers,
    podmanSecretMappings: [
        [
            type: 'usernamePassword',
            credentialsId: 'Jenkins',
            podmanSecretPasswordName: 'jenkins_admin_password',
            podmanSecretUsernameName: 'jenkins_admin_username'
        ],
        [
            type: 'usernamePassword',
            credentialsId: 'Forgejo PAT',
            podmanSecretPasswordName: 'jenkins_git_token',
            podmanSecretUsernameName: 'jenkins_git_username'
        ],
        [
            type: 'usernamePassword',
            credentialsId: 'Email noreply',
            podmanSecretPasswordName: 'lab_smtp_password',
            podmanSecretUsernameName: 'lab_smtp_username'
        ],
        [
            type: 'string',
            credentialsId: 'jenkins-alert-email',
            podmanSecretStringName: 'jenkins_alert_email'
        ]
    ]
)
