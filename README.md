# Overview: 
`tap-build-action` is a github action that uses the [keg-cli](https://github.com/KegHub/keg-cli) to build any tap's docker image and submit it to the github docker registry. 

For more information on taps and the keg, see [keg-hub](https://github.com/KegHub/keg-hub)

# Usage

```yml
- uses: KegHub/tap-build-action@0.0.3
  with:
    # The keg-cli git branch to use for building and pushing the image.
    #
    # Default: 'develop'
    cli_git_branch: ''

    # The git ref of the tap to checkout.
    # When checking out the repository that triggered a workflow, this 
    # defaults to the reference or SHA for that event. 
    # 
    # NOTE: This has to be a branch ref. Tags will not work.
    #
    # Example: /ref/heads/my-feature-branch
    # Default: ${{ github.ref }}
    tap_ref: ''

    # Repository name with owner. 
    #
    # Example: KegHub/keg-herkin
    # Default: ${{ github.repository }}
    repository: ''


    # This action will tag your tap's built image with this tag name.
    # 
    # Default: 'develop'
    tag: ''

    # Personal access token (PAT) used to fetch the repository and push its image. 
    # We recommend using a service account with the least permissions necessary.
    # Also when generating a new PAT, select the least scopes necessary.
    #
    # Default: ${{ github.token }}
    token: ''

    # The username to use for logging into the docker registry 
    # with the docker-cli
    #
    # Default: 'keg-admin'
    user: ''
```
