import numpy as np
import pandas as pd
import datetime

def parse_uptime(log_file):
    with open(log_file) as f:
        lines = f.readlines()
    lines = [line.strip() for line in lines]
    lines = [line for line in lines if line]
    # EXAMPLE:
    
    # g010:
    #     ----------
    #     days:
    #         65
    #     seconds:
    #         5635475
    #     since_iso:
    #         2023-01-03T16:31:26.507220
    #     since_t:
    #         1672763486
    #     time:
    #         5:24
    #     users:
    #         1
    # match ---------- 
    df = pd.DataFrame()
    split_str = "----------"
    split_idx = [i for i, s in enumerate(lines) if split_str in s]
    for i in range(len(split_idx)):
        name = lines[split_idx[i]-1]
        name = name.split(':')[0]
        if i == len(split_idx)-1:
            config = lines[split_idx[i]+1:]
        else:
            config = lines[split_idx[i]+1:split_idx[i+1]]
        key_list, value_list = [], []
        for line_idx, line in enumerate(config):
            if line_idx % 2 == 0:
                key_list.append(line.split(':')[0])
            else:
                value_list.append(line)
        append_dict = dict(zip(key_list, value_list))
        print(name, append_dict)
        append_df = pd.DataFrame(append_dict, index=[name])
        df = pd.concat([df, append_df])
    csv_file = log_file.replace('.log', '.csv')
    df.to_csv(csv_file, index=True)
    return df
    
    
if __name__ == '__main__':
    current_date = datetime.datetime.now().strftime('%Y%m%d')
    parse_uptime(f"./logs/uptime/{current_date}.log")