import React from 'react';
import { Dimmer, Loader } from 'semantic-ui-react';

class FormLoader extends React.Component{
    render(){
        return(
            <Dimmer active>
                 <Loader indeterminate size="big">Creating Vouchers </Loader>
          </Dimmer>
        )
    }
    
}

export default FormLoader