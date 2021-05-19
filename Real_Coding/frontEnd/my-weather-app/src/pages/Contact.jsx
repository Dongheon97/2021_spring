
function Contact(){
    const API_URL = "https://github.com/Dongheon97";
    const Email = "dongheon.lee97@gmail.com";
    const Address = "Dorm No.8, Daehak-ro 99, Yuseong-gu, Daejeon, South Korea";
    const PostNumber = "34134";


    return(
            <div>
                <h1>Contact Dongheon Lee</h1>
                <p>{Email}</p>
                <p>{API_URL}</p>
                <p>{Address}</p>
                <p>{PostNumber}</p>


            </div>

    );
}

export default Contact;