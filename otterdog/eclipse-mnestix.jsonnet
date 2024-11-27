local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-mnestix') {
  settings+: {
    description: 'Mnestix as an open source platform provides an easy way to implement industry usecases using the Asset Administration Shell and helps make this technology understandable, applicable 
and easy to use.',
    name: "Eclipse Mnestix AAS Browser ",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
    email: 'mnestix-dev@eclipse.org',
    blog: 'https://mnestix.io',
  },
  _repositories+:: [
    orgs.newRepo('mnestix-browser') {
        description: 'Mnestix Browser enables you to easily get started with the AAS and browse through repositories',
        homepage: 'https://xitaso.com/kompetenzen/mnestix/'
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
        variables+: [
            orgs.newRepoVariable('REGISTRY_USER') {
              value: "mnestix",
            },
        ],
        secrets+: [
          orgs.newRepoSecret('REGISTRY_PASS') {
            value: "bitwarden:6578c4d0-4e6d-4346-9037-b47c3c206c5a@github_docker_secret",
          },
        ],
        topics+: [
          'asset-administration-shell',
          'aas',
          'industry40'
        ],
    }
  ]
}
