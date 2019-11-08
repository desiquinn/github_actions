workflow "New workflow" {
    on = "push"
    resolves = "Deploy Hello World"
}

action "Build Hello World" {
    uses = "./actions/build"
}

action "Lint Hello World" {
    uses = "./actions/lint"
}

action "Deploy Hello World" {
    needs = ["Build Hello World", "Lint Hello World"]
    uses = "serverless/github-action@master"
    secrets =  ["ACCESS_KEY_ID", "SECRET_ACCESS_KEY"]
    args = "deploy"
}
