local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('dt.mnestix', 'eclipse-mnestix') {
  settings+: {
    description: 'Mnestix as an open source platform provides an easy way to implement industry usecases using the AAS and helps make this technology easy to use',
    name: "Eclipse Mnestix",
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
    orgs.newOrgSecret('TEST_ADMIN_USER_PASSWORD') {
      value: "********",
    },
    orgs.newOrgSecret('TEST_USER_PASSWORD') {
      value: "********",
    },
  ],
  _repositories+:: [
    orgs.newRepo('mnestix-browser') {
      description: 'The Eclipse Mnestix AAS Browser enables you to easily get started with the AAS and browse through repositories',
      homepage: 'https://xitaso.com/en/competences/mnestix/',
      allow_merge_commit: true,
      delete_branch_on_merge: true,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      branch_protection_rules+: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 2,
        },
        orgs.newBranchProtectionRule('dev') {
          required_approving_review_count: 2,
          allows_force_pushes: true
        },
      ],
      topics+: [
        'asset-administration-shell',
        'aasx',
        'digital-twin-application',
        'industry40',
        'industry-40',
        'iiot',
        'administration-shell',
        'digitaltwin',
        'digitaltwins',
        'eclipse',
        'mnestix'
      ],
    },

    orgs.newRepo('mnestix-proxy') {
      description: 'The Eclipse Mnestix Proxy selectively exposes and controls access to AAS functionalities and the AAS infrastructure.',
      homepage: 'https://xitaso.com/en/competences/mnestix/',
      allow_merge_commit: true,
      delete_branch_on_merge: true,
      web_commit_signoff_required: false,
      branch_protection_rules+: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 2,
        },
        orgs.newBranchProtectionRule('dev') {
          required_approving_review_count: 2,
          allows_force_pushes: true
        },
      ],
      topics+: [
        'asset-administration-shell',
        'industry40',
        'industry-40',
        'iiot',
        'administration-shell',
        'digitaltwin',
        'digitaltwins',
        'eclipse',
        'mnestix'
      ],
    },

    orgs.newRepo('.github'), ## added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml',

    orgs.newRepo('mnestix-browser-example-submodel-visualizations') {
      description: 'An example submodel visualization to guide the user in the creation of their own custom visualization. We recommend to use this repository as a template',
      homepage: 'https://github.com/eclipse-mnestix/mnestix-browser/wiki/How-to-create-custom-submodel-visualizations',
      allow_forking: true,
      allow_merge_commit: true,
      delete_branch_on_merge: true,
      web_commit_signoff_required: false,
      is_template: true,
      branch_protection_rules+: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 2,
        },
      ],
      topics+: [
        'asset-administration-shell',
        'aas',
        'industry40',
        'custom-submodel',
        'mnestix'
      ],
    },
  ]
}
