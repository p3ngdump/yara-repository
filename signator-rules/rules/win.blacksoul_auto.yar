rule win_blacksoul_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.blacksoul."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.blacksoul"
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
        $sequence_0 = { 8b4588 84d2 7467 85ff }
            // n = 4, score = 200
            //   8b4588               | mov                 eax, dword ptr [ebp - 0x78]
            //   84d2                 | test                dl, dl
            //   7467                 | je                  0x69
            //   85ff                 | test                edi, edi

        $sequence_1 = { 7203 8b45d8 803c3000 7441 807f0400 8bc3 750b }
            // n = 7, score = 200
            //   7203                 | jb                  5
            //   8b45d8               | mov                 eax, dword ptr [ebp - 0x28]
            //   803c3000             | cmp                 byte ptr [eax + esi], 0
            //   7441                 | je                  0x43
            //   807f0400             | cmp                 byte ptr [edi + 4], 0
            //   8bc3                 | mov                 eax, ebx
            //   750b                 | jne                 0xd

        $sequence_2 = { 0f8402020000 84c0 0f8efa010000 837d9400 7509 83a578ffffff00 }
            // n = 6, score = 200
            //   0f8402020000         | je                  0x208
            //   84c0                 | test                al, al
            //   0f8efa010000         | jle                 0x200
            //   837d9400             | cmp                 dword ptr [ebp - 0x6c], 0
            //   7509                 | jne                 0xb
            //   83a578ffffff00       | and                 dword ptr [ebp - 0x88], 0

        $sequence_3 = { e8???????? 8b750c 46 89750c 3bf3 75e9 eb2f }
            // n = 7, score = 200
            //   e8????????           |                     
            //   8b750c               | mov                 esi, dword ptr [ebp + 0xc]
            //   46                   | inc                 esi
            //   89750c               | mov                 dword ptr [ebp + 0xc], esi
            //   3bf3                 | cmp                 esi, ebx
            //   75e9                 | jne                 0xffffffeb
            //   eb2f                 | jmp                 0x31

        $sequence_4 = { 8b4db8 8b55a8 ebae 8b7598 8bce 83a57cffffff00 e8???????? }
            // n = 7, score = 200
            //   8b4db8               | mov                 ecx, dword ptr [ebp - 0x48]
            //   8b55a8               | mov                 edx, dword ptr [ebp - 0x58]
            //   ebae                 | jmp                 0xffffffb0
            //   8b7598               | mov                 esi, dword ptr [ebp - 0x68]
            //   8bce                 | mov                 ecx, esi
            //   83a57cffffff00       | and                 dword ptr [ebp - 0x84], 0
            //   e8????????           |                     

        $sequence_5 = { 8a4601 3c78 7425 3c58 }
            // n = 4, score = 200
            //   8a4601               | mov                 al, byte ptr [esi + 1]
            //   3c78                 | cmp                 al, 0x78
            //   7425                 | je                  0x27
            //   3c58                 | cmp                 al, 0x58

        $sequence_6 = { 8d45c0 c68564ffffff00 8d4da8 ffb564ffffff 81cb00200000 50 }
            // n = 6, score = 200
            //   8d45c0               | lea                 eax, [ebp - 0x40]
            //   c68564ffffff00       | mov                 byte ptr [ebp - 0x9c], 0
            //   8d4da8               | lea                 ecx, [ebp - 0x58]
            //   ffb564ffffff         | push                dword ptr [ebp - 0x9c]
            //   81cb00200000         | or                  ebx, 0x2000
            //   50                   | push                eax

        $sequence_7 = { 894594 894598 e8???????? 59 59 84c0 7460 }
            // n = 7, score = 200
            //   894594               | mov                 dword ptr [ebp - 0x6c], eax
            //   894598               | mov                 dword ptr [ebp - 0x68], eax
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   59                   | pop                 ecx
            //   84c0                 | test                al, al
            //   7460                 | je                  0x62

        $sequence_8 = { c645b800 e8???????? ffb57cffffff c645fc03 }
            // n = 4, score = 200
            //   c645b800             | mov                 byte ptr [ebp - 0x48], 0
            //   e8????????           |                     
            //   ffb57cffffff         | push                dword ptr [ebp - 0x84]
            //   c645fc03             | mov                 byte ptr [ebp - 4], 3

        $sequence_9 = { c745b00f000000 c6459c00 e8???????? ffb570ffffff c645fc03 33f6 53 }
            // n = 7, score = 200
            //   c745b00f000000       | mov                 dword ptr [ebp - 0x50], 0xf
            //   c6459c00             | mov                 byte ptr [ebp - 0x64], 0
            //   e8????????           |                     
            //   ffb570ffffff         | push                dword ptr [ebp - 0x90]
            //   c645fc03             | mov                 byte ptr [ebp - 4], 3
            //   33f6                 | xor                 esi, esi
            //   53                   | push                ebx

    condition:
        7 of them and filesize < 1823640
}