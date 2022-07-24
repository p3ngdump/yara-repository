rule win_mykings_spreader_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.mykings_spreader."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mykings_spreader"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { aa 0000 00e9 15ffffffa5 66750d 5c a4 }
            // n = 7, score = 100
            //   aa                   | stosb               byte ptr es:[edi], al
            //   0000                 | add                 byte ptr [eax], al
            //   00e9                 | add                 cl, ch
            //   15ffffffa5           | adc                 eax, 0xa5ffffff
            //   66750d               | jne                 0x10
            //   5c                   | pop                 esp
            //   a4                   | movsb               byte ptr es:[edi], byte ptr [esi]

        $sequence_1 = { 8b45fc 8b00 8b40f0 8a4402ff 3c2a 0f85d2000000 8b45fc }
            // n = 7, score = 100
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b00                 | mov                 eax, dword ptr [eax]
            //   8b40f0               | mov                 eax, dword ptr [eax - 0x10]
            //   8a4402ff             | mov                 al, byte ptr [edx + eax - 1]
            //   3c2a                 | cmp                 al, 0x2a
            //   0f85d2000000         | jne                 0xd8
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_2 = { 50 85c0 0f85dc000000 8b5df8 89d8 e8???????? c70300000000 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   85c0                 | test                eax, eax
            //   0f85dc000000         | jne                 0xe2
            //   8b5df8               | mov                 ebx, dword ptr [ebp - 8]
            //   89d8                 | mov                 eax, ebx
            //   e8????????           |                     
            //   c70300000000         | mov                 dword ptr [ebx], 0

        $sequence_3 = { 89c2 52 ff35???????? 6a00 ff35???????? e8???????? 6a01 }
            // n = 7, score = 100
            //   89c2                 | mov                 edx, eax
            //   52                   | push                edx
            //   ff35????????         |                     
            //   6a00                 | push                0
            //   ff35????????         |                     
            //   e8????????           |                     
            //   6a01                 | push                1

        $sequence_4 = { 7503 895dfc 89d8 39f0 7ca4 8b45fc 48 }
            // n = 7, score = 100
            //   7503                 | jne                 5
            //   895dfc               | mov                 dword ptr [ebp - 4], ebx
            //   89d8                 | mov                 eax, ebx
            //   39f0                 | cmp                 eax, esi
            //   7ca4                 | jl                  0xffffffa6
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   48                   | dec                 eax

        $sequence_5 = { 8d85e0fdffff e8???????? 8b95e0fdffff 89d8 8b0b ff5174 8d9550ffffff }
            // n = 7, score = 100
            //   8d85e0fdffff         | lea                 eax, [ebp - 0x220]
            //   e8????????           |                     
            //   8b95e0fdffff         | mov                 edx, dword ptr [ebp - 0x220]
            //   89d8                 | mov                 eax, ebx
            //   8b0b                 | mov                 ecx, dword ptr [ebx]
            //   ff5174               | call                dword ptr [ecx + 0x74]
            //   8d9550ffffff         | lea                 edx, [ebp - 0xb0]

        $sequence_6 = { 8b542404 8b4210 29c1 89cf 89f8 3b0424 7e03 }
            // n = 7, score = 100
            //   8b542404             | mov                 edx, dword ptr [esp + 4]
            //   8b4210               | mov                 eax, dword ptr [edx + 0x10]
            //   29c1                 | sub                 ecx, eax
            //   89cf                 | mov                 edi, ecx
            //   89f8                 | mov                 eax, edi
            //   3b0424               | cmp                 eax, dword ptr [esp]
            //   7e03                 | jle                 5

        $sequence_7 = { 89c3 8b03 85c0 7410 832b08 8b03 e8???????? }
            // n = 7, score = 100
            //   89c3                 | mov                 ebx, eax
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   85c0                 | test                eax, eax
            //   7410                 | je                  0x12
            //   832b08               | sub                 dword ptr [ebx], 8
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   e8????????           |                     

        $sequence_8 = { 68???????? 55 aa e8???????? 8bf0 83c408 85f6 }
            // n = 7, score = 100
            //   68????????           |                     
            //   55                   | push                ebp
            //   aa                   | stosb               byte ptr es:[edi], al
            //   e8????????           |                     
            //   8bf0                 | mov                 esi, eax
            //   83c408               | add                 esp, 8
            //   85f6                 | test                esi, esi

        $sequence_9 = { 4a 8d7600 42 0fb60c13 0fa30d???????? 7304 c604135c }
            // n = 7, score = 100
            //   4a                   | dec                 edx
            //   8d7600               | lea                 esi, [esi]
            //   42                   | inc                 edx
            //   0fb60c13             | movzx               ecx, byte ptr [ebx + edx]
            //   0fa30d????????       |                     
            //   7304                 | jae                 6
            //   c604135c             | mov                 byte ptr [ebx + edx], 0x5c

    condition:
        7 of them and filesize < 1581056
}