from __future__ import print_function


def handler(event, context):
    print('value1 = {}'.format(event['key1']))
    print('value2 = {}'.format(event['key2']))
    print('value3 = {}'.format(event['key3']))
    return event['key1'] #echo first key value
