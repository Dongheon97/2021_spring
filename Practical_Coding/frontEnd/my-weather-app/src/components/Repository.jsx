import * as url from "url";

function Repository(){

    const spring_URL = "https://github.com/Dongheon97/2021_spring";
    const mogakco_URL = "https://github.com/Dongheon97/2020_Winter_Assemble_and_Selfcoding";
    const tdddemo_URL = "https://github.com/Dongheon97/unit-test-tdddemo";
    const termProject_URL = "https://github.com/Dongheon97/Term_Project_201702052_-";
    const pairProgramming_URL ="https://github.com/Dongheon97/OPP_Pair_Programming";
    const dataStructure_URL = "https://github.com/Dongheon97/Data-Structure";
    const upl2021_URL = "https://github.com/Dongheon97/UPL2021";
    const git_lecture_URL = "https://github.com/Dongheon97/git_lecture";
    const dongheon_URL  = "https://github.com/Dongheon97/Dongheon97";
    const CP201702052_URL = "https://github.com/Dongheon97/CP_201702052";

    const url_list = [spring_URL, mogakco_URL, tdddemo_URL, termProject_URL, pairProgramming_URL, dataStructure_URL
                        ,upl2021_URL, git_lecture_URL, dongheon_URL, CP201702052_URL]

    return (
        <div>
            <h1>Repositories</h1>
            <ul>
                <ul>{url_list.map((item, index) => {
                        return <ul>
                            <li key = {index}>{"Repository " + index}</li>
                            <li key = {index}>{item}</li>
                            <li>{"\n"}</li>
                            </ul>

                })}
                </ul>
            </ul>
        </div>
    );
}

export default Repository;