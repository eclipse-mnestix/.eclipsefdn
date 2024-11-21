local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-mnestix') {
  settings+: {
    description: "",
    name: "Eclipse Mnestix AAS Browser ",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('mnestix-browser') {
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
