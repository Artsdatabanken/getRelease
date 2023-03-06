## Fetches latest release from github repository with the use of github api
Add following step in github actions to create a version number to fetch from      
    steps:  
      - name: Create release
        uses: ncipollo/release-action@v1
        with:
          artifacts: "naturvern/*"
          tag: v_${{ github.run_number }}

Script uses jq on Linux to parse the json repsonse from the github api