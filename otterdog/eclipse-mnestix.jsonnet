local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-mnestix') {
  settings+: {
    description: 'Mnestix as an open source platform provides an easy way to implement industry usecases using the AAS and helps make this technology easy to use',
    name: "Eclipse Mnestix AAS Browser ",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
    email: 'mnestix-dev@eclipse.org',
    blog: 'https://mnestix.io',
  },
  secrets: [
    orgs.newOrgSecret('DOCKER_USERNAME') {
      value: "pass:bots/dt.mnestix/docker.com/username",
    },
    orgs.newOrgSecret('DOCKER_API_TOKEN') {
      value: "pass:bots/dt.mnestix/docker.com/api-token",
    },
  ],
  _repositories+:: [
    orgs.newRepo('mnestix-browser') {
        description: 'Mnestix Browser enables you to easily get started with the AAS and browse through repositories',
        homepage: 'https://xitaso.com/kompetenzen/mnestix/',
        allow_merge_commit: true,
        delete_branch_on_merge: true,
        web_commit_signoff_required: false,
        branch_protection_rules+: [
            orgs.newBranchProtectionRule('main') {
              required_approving_review_count: 2,
            },
            orgs.newBranchProtectionRule('staging') {
              required_approving_review_count: 2,
            },
            orgs.newBranchProtectionRule('dev') {
              required_approving_review_count: 2,
            },
        ],
        workflows+: {
          default_workflow_permissions: 'write',
        },
        topics+: [
          'asset-administration-shell',
          'aas',
          'industry40'
        ],
      allow_merge_commit: true,
      delete_branch_on_merge: true,
      web_commit_signoff_required: false,
      branch_protection_rules+: [
        orgs.newBranchProtectionRule('main') {},
        orgs.newBranchProtectionRule('dev') {},
      ],
      variables+: [
        orgs.newRepoVariable('AZURE_REGISTRY_USER') {
          value: "mnestixcr",
        },
        orgs.newRepoVariable('REGISTRY_USER') {
          value: "mnestix",
        },
      ]
    }
  ]
}
