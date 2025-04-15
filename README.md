# Jetstack Jetstack

## How do I install these formulae?

`brew install jetstack/jetstack/<formula>`

Or `brew tap jetstack/jetstack` and then `brew install <formula>`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Updating Paranoia

1. Open the `paranoia.rb` file in your editor
    1. Update the URL to the latest version
    2. Update the SHA256 checksum
        1. In the Latest Paranoia release page, click on the `Assets` dropdown
        2. Download the `Source Code .tar.gz` file
        3. Open the terminal and navigate to the directory where the file is downloaded
        4. Run the command `shasum -a 256 <file>` to generate the SHA256 checksum
        5. Copy the checksum and paste it in the `paranoia.rb` file
    3. Update the `version` to the latest version in the `root_url` line.
2. Commit the changes
3. Wait for tests to complete
4. Assign the label `pr-pull` to the PR
5. Wait for the PR to be action
