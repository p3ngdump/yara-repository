rule win_danabot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.danabot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.danabot"
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
        $sequence_0 = { 7c14 8b55fc 66837c42fe5c 7504 8bd8 eb05 48 }
            // n = 7, score = 400
            //   7c14                 | jl                  0x16
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   66837c42fe5c         | cmp                 word ptr [edx + eax*2 - 2], 0x5c
            //   7504                 | jne                 6
            //   8bd8                 | mov                 ebx, eax
            //   eb05                 | jmp                 7
            //   48                   | dec                 eax

        $sequence_1 = { e8???????? 8b07 50 8b442458 50 6a0a 68e0e62cfe }
            // n = 7, score = 400
            //   e8????????           |                     
            //   8b07                 | mov                 eax, dword ptr [edi]
            //   50                   | push                eax
            //   8b442458             | mov                 eax, dword ptr [esp + 0x58]
            //   50                   | push                eax
            //   6a0a                 | push                0xa
            //   68e0e62cfe           | push                0xfe2ce6e0

        $sequence_2 = { 8b03 50 8b44242c 50 6a14 }
            // n = 5, score = 400
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   50                   | push                eax
            //   8b44242c             | mov                 eax, dword ptr [esp + 0x2c]
            //   50                   | push                eax
            //   6a14                 | push                0x14

        $sequence_3 = { 8bf8 33db 85f6 7e2f 8bc6 e8???????? }
            // n = 6, score = 400
            //   8bf8                 | mov                 edi, eax
            //   33db                 | xor                 ebx, ebx
            //   85f6                 | test                esi, esi
            //   7e2f                 | jle                 0x31
            //   8bc6                 | mov                 eax, esi
            //   e8????????           |                     

        $sequence_4 = { 8bd3 e8???????? 8b45f8 8d55fc }
            // n = 4, score = 400
            //   8bd3                 | mov                 edx, ebx
            //   e8????????           |                     
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8d55fc               | lea                 edx, [ebp - 4]

        $sequence_5 = { 8b03 50 8b44241c 50 6a14 68aac7b6e9 }
            // n = 6, score = 400
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   50                   | push                eax
            //   8b44241c             | mov                 eax, dword ptr [esp + 0x1c]
            //   50                   | push                eax
            //   6a14                 | push                0x14
            //   68aac7b6e9           | push                0xe9b6c7aa

        $sequence_6 = { 8b06 50 8b442424 50 6a11 }
            // n = 5, score = 400
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   50                   | push                eax
            //   8b442424             | mov                 eax, dword ptr [esp + 0x24]
            //   50                   | push                eax
            //   6a11                 | push                0x11

        $sequence_7 = { 892d???????? e8???????? 58 83c009 a3???????? cd03 0f1f00 }
            // n = 7, score = 400
            //   892d????????         |                     
            //   e8????????           |                     
            //   58                   | pop                 eax
            //   83c009               | add                 eax, 9
            //   a3????????           |                     
            //   cd03                 | int                 3
            //   0f1f00               | nop                 dword ptr [eax]

        $sequence_8 = { e8???????? 8b03 50 8b442454 50 }
            // n = 5, score = 400
            //   e8????????           |                     
            //   8b03                 | mov                 eax, dword ptr [ebx]
            //   50                   | push                eax
            //   8b442454             | mov                 eax, dword ptr [esp + 0x54]
            //   50                   | push                eax

        $sequence_9 = { e8???????? 8b0424 8bd7 e8???????? eb08 }
            // n = 5, score = 400
            //   e8????????           |                     
            //   8b0424               | mov                 eax, dword ptr [esp]
            //   8bd7                 | mov                 edx, edi
            //   e8????????           |                     
            //   eb08                 | jmp                 0xa

    condition:
        7 of them and filesize < 237568
}