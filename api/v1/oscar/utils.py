from django.utils.encoding import force_text

def prepare_sku_code(options):
        '''
        options a list of ProductOption
        '''
        result = []
        for option in options:
            if option.code.startswith('sku'):
                result.append(force_text(option.value))
        return '__'.join(result)