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
        ],
        secrets+: [
          orgs.newRepoSecret('AD_CLIENT_ID') {
            value: "bitwarden:3738b95d-c42b-4e97-acd5-59117d1a3ec5@github_azure_client_id_secret",
          },
          orgs.newRepoSecret('AD_TENANT_ID') {
            value: "bitwarden:c46fd5c7-bfb6-4857-b5d7-0a6e4a273528@github_azure_tenant_id_secret",
          },
          orgs.newRepoSecret('AZURE_REGISTRY_PASS') {
            value: "bitwarden:a67f8057-c5e3-4e79-8ae0-b4c777fc846b@github_azure_cr_secret",
          },
          orgs.newRepoSecret('REGISTRY_PASS') {
            value: "bitwarden:6578c4d0-4e6d-4346-9037-b47c3c206c5a@github_docker_secret",
          },
        ],
    }
  ]
}
